----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:15 04/11/2020 
-- Design Name: 
-- Module Name:    CONVOLUTION_UNIT - Behavioral 
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

entity CONVOLUTION_UNIT is
	 Generic (LINESIZE : integer := 256;
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
			);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  START : in  STD_LOGIC;
			  
			  KERNEL_SIZE: in integer range 0 to KERNELSIZE-1;
			  IMAGE_WIDTH: in integer range 0 to LINESIZE-1;
			  IMAGE_HEIGHT: in integer range 0 to LINESIZE-1;
			  
			  RES_WIDTH: out integer range 0 to LINESIZE-1;
			  RES_HEIGHT: out integer range 0 to LINESIZE-1;
			  			  
			  --KERNEL_MEM_IN: in std_logic_vector(WORD-1 downto 0);
			  --IMAGE_MEM_IN: in std_logic_vector(WORD-1 downto 0);
			  
			  --CONVOLUTION_RESULT: out std_logic_vector(WORD-1 downto 0); --dummy temp port
			  RES_MEM_OUT: out std_logic_vector(WORD-1 downto 0);
			  
			  HALT: out std_logic;
			  ERROR: out std_logic
			  );
end CONVOLUTION_UNIT;

architecture Behavioral of CONVOLUTION_UNIT is

component CONTROLLER is
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
end component CONTROLLER;

component MATRIX_UNIT is
 Generic(
	   MATRIXSIZE: integer := 256;
		MATRIXBITS: integer := 8;
		ADDRSIZE: integer := 16;
		WORD : integer := 8
	 );
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  RW : in std_logic;
			  EN : in std_logic;
           WIDTH : in integer range 0 to MATRIXSIZE-1;
           HEIGHT : in integer range 0 to MATRIXSIZE-1;
			  DONE : out std_logic;
           LINE : out integer range 0 to MATRIXSIZE-1;
           COLUMN : out integer range 0 to MATRIXSIZE-1;
			  DIN : in  std_logic_vector(WORD-1 downto 0);
			  DOUT : out  std_logic_vector(WORD-1 downto 0));
end component MATRIX_UNIT;

component CONVOLUTION_MODULE is
	  	 Generic (LINESIZE : integer := 256;
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
			);
        Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           KERNEL_EN : in  STD_LOGIC;
           KERNEL_IN : in STD_LOGIC_VECTOR (WORD-1 downto 0);
			  KERNEL_SIZE : in integer range 0 to KERNELSIZE-1;
			  LINE_EN : in std_logic;
			  LINE_LENGTH : in integer range 0 to LINESIZE-1;
			  LINE_IN : in std_logic_vector(WORD-1 downto 0);
			  CONV_RESULT: out std_logic_vector(WORD-1 downto 0)
			  );
end component CONVOLUTION_MODULE;

signal kernel_en, line_en, res_en, kernel_done, line_done, res_done, conv_en: std_logic;
signal kern_line, kern_col, kern_size: integer range 0 to KERNELSIZE-1;
signal kernel_in, line_in, conv_res: std_logic_vector(WORD-1 downto 0);
signal r_width, r_height, res_line, res_col, line_line, line_col, img_width, img_height: integer range 0 to LINESIZE-1;
signal KERNEL_RW: std_logic;
signal IMAGE_RW: std_logic;
signal RES_RW: std_logic;

begin

conv_module: CONVOLUTION_MODULE generic map(LINESIZE, KERNELSIZE, WORD)
	port map(CLK, RST, kernel_en, kernel_in, kern_size, conv_en, img_width, line_in, conv_res);

paramSet: process(START, RST, KERNEL_SIZE, IMAGE_WIDTH, IMAGE_HEIGHT)
begin
	if (RST='1') then
		img_width <= 0;
		img_height <= 0;
		kern_size <= 0;
		KERNEL_RW <= '0';
		IMAGE_RW <= '0';
		RES_RW <= '0';
	elsif (rising_edge(START)) then
		img_width <= IMAGE_WIDTH;
		img_height <= IMAGE_HEIGHT;
		kern_size <= KERNEL_SIZE;
		KERNEL_RW <= '0';
		IMAGE_RW <= '0';
		RES_RW <= '1';
	end if;
end process;

RES_WIDTH <= r_width;
RES_HEIGHT <= r_height;

brain: CONTROLLER generic map(LINESIZE, KERNELSIZE, WORD) 
	port map(CLK, RST, START, 
		kernel_done, kernel_en, KERNEL_SIZE, kern_line, kern_col, 
		IMAGE_WIDTH, IMAGE_HEIGHT, 
		line_en, line_done, line_line, line_col,
		conv_en,
		res_en, res_done, res_line, res_col, r_width, r_height,
		HALT, ERROR
		);

image_mem: MATRIX_UNIT generic map(LINESIZE, WORD, WORD*2, WORD)
	port map(CLK, RST, IMAGE_RW, line_en, img_width, img_height, line_done, line_line, line_col, (others => '0'), line_in);
	
kernel_mem: MATRIX_UNIT generic map(KERNELSIZE, 4, WORD, WORD)
	port map(CLK, RST, KERNEL_RW, kernel_en, kern_size, kern_size, kernel_done, kern_line, kern_col, (others => '0'), kernel_in);
	
image_out_mem: MATRIX_UNIT generic map(LINESIZE, WORD, WORD*2, WORD)
	port map(CLK, RST, RES_RW, res_en, r_width, r_height, res_done, res_line, res_col, conv_res, RES_MEM_OUT);

end Behavioral;

