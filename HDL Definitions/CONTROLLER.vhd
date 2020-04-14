----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:27 04/11/2020 
-- Design Name: 
-- Module Name:    CONTROLLER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CONTROLLER is
	 Generic (
		LINESIZE: integer:= 256;
		KERNELSIZE: integer:=9;
		WORD: integer:=8
	 );
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           START : in  STD_LOGIC;
			  
			  KERNEL_DONE: in std_logic;
			  KERNEL_EN: out std_logic;
			  KERNEL_SIZE: in integer range 0 to KERNELSIZE-1;
			  KERNEL_LINE: in integer range 0 to KERNELSIZE-1;
			  KERNEL_COL: in integer range 0 to KERNELSIZE-1;
			  
			  IMAGE_WIDTH: in integer range 0 to LINESIZE-1;
			  IMAGE_HEIGHT: in integer range 0 to LINESIZE-1;
			  
			  LINE_EN: out std_logic;
			  LINE_DONE: in std_logic;
			  LINE_LINE: in integer range 0 to LINESIZE-1;
			  LINE_COL: in integer range 0 to LINESIZE-1;
			  
			  CONV_EN: out std_logic;
			  
			  RES_EN: out std_logic;
			  RES_DONE: in std_logic;
			  RES_LINE: in integer range 0 to LINESIZE-1;
			  RES_COL: in integer range 0 to LINESIZE-1;  
			  RES_WIDTH: out integer range 0 to LINESIZE-1;
			  RES_HEIGHT: out integer range 0 to LINESIZE-1;
			  
           HALT : out  STD_LOGIC;
           ERROR : out  STD_LOGIC
			  );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

type t_states is (
	s_IDLE,
	s_INIT_KERNEL,
	s_INIT_CONVOLUTION,
	s_PROCESS_IMAGE,
	s_HALT,
	s_ERROR
);

type t_fsm_state is record
	cur, nxt: t_states;
end record;

signal state: t_fsm_state;
signal conv_loaded, kernel_range_break, res_range_break: boolean;
signal r_w, r_h: integer range 0 to LINESIZE-1;

begin

	r_w <= IMAGE_WIDTH-KERNEL_SIZE;
	r_h <= IMAGE_HEIGHT-KERNEL_SIZE;
	
	conv_loaded <= LINE_LINE = KERNEL_SIZE and LINE_COL = IMAGE_WIDTH;
	kernel_range_break <= KERNEL_LINE > KERNEL_SIZE and KERNEL_COL > KERNEL_SIZE;
	res_range_break <= RES_LINE > r_h and RES_COL > r_w;
	
	RES_WIDTH <= r_w;
	RES_HEIGHT <= r_h;

	process_FSM_MEM: process(CLK, RST, state.nxt)
	begin
		if (RST = '1') then
			state.cur <= s_IDLE;
		elsif (rising_edge(CLK)) then
			state.cur <= state.nxt;
		end if;
	end process;
	
	process_FSM_NEXT: process(state.cur, START, KERNEL_DONE, RES_DONE, conv_loaded, kernel_range_break, res_range_break)
	begin
		case state.cur is
			when s_IDLE => 
				if (START = '1') then
					state.nxt <= s_INIT_KERNEL;
				else
					state.nxt <= s_IDLE;
				end if;
			when s_INIT_KERNEL =>
				if (KERNEL_DONE = '1') then
					state.nxt <= s_INIT_CONVOLUTION;
				elsif (kernel_range_break) then
					state.nxt <= s_ERROR;
				else
					state.nxt <= s_INIT_KERNEL;
				end if;
			when s_INIT_CONVOLUTION =>
				if (res_range_break) then
					state.nxt <= s_ERROR;
				elsif (conv_loaded) then  -- check conv is initialized
					state.nxt <= s_PROCESS_IMAGE;
				else
					state.nxt <= s_INIT_CONVOLUTION;
				end if;
			when s_PROCESS_IMAGE =>
				if (RES_DONE = '1') then -- check convolution is done
					state.nxt <= s_HALT;
				else
					state.nxt <= s_PROCESS_IMAGE;
				end if;
			when others => state.nxt <= s_ERROR;
		end case;
	end process;
	
	process_OUT_ERROR: process(state.cur)
	begin
		if (state.cur = s_ERROR) then
			ERROR <= '1';
		else
			ERROR <= '0';
		end if;
	end process;
	
	process_OUT_STOP: process(state.cur)
	begin
		if (state.cur = s_HALT) then
			HALT <= '1';
		else
			HALT <= '0';
		end if;
	end process;
		
	kerninit: process(state.cur)
	begin
		if (state.cur = s_INIT_KERNEL) then
			KERNEL_EN <= '1';
		else
			KERNEL_EN <= '0';
		end if;
	end process;
	
	lineread: process(state.cur, LINE_DONE)
	begin
		if (state.cur = s_INIT_CONVOLUTION or state.cur = s_PROCESS_IMAGE) then
			if (LINE_DONE = '1') then
				LINE_EN <= '0';
			else
				LINE_EN <= '1';
			end if;
		else
			LINE_EN <= '0';
		end if;
	end process;
	
	conven: process(state.cur)
	begin
		if (state.cur = s_INIT_CONVOLUTION or state.cur = s_PROCESS_IMAGE) then
			CONV_EN <= '1';
		else
			CONV_EN <= '0';
		end if;
	end process;
	
	reswrite: process(state.cur)
   begin
		if (state.cur = s_PROCESS_IMAGE) then
			RES_EN <= '1';
		else
			RES_EN <= '0';
		end if;
	end process;

end Behavioral;

