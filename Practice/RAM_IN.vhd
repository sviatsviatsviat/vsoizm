----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:16 04/11/2020 
-- Design Name: 
-- Module Name:    RAM_IN - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
	 Generic(
		ADDRSIZE: integer := 16;
		WORD : integer := 8
	 );
	Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           ADR : in  std_logic_vector(ADDRSIZE-1 downto 0);
           DIN : in  std_logic_vector(WORD-1 downto 0);
           DOUT : out  std_logic_vector(WORD-1 downto 0));
end RAM;

architecture Behavioral of RAM is

constant zeros: std_logic_vector(WORD-2 downto 0) := (others => '0');

type t_ram is array (0 to 2**ADDRSIZE-1) of std_logic_vector(WORD-1 downto 0);
signal c_ram : t_ram := (
	others => zeros & "1"
);

signal reg_in  : std_logic_vector(WORD-1 downto 0);
signal reg_out : std_logic_vector(WORD-1 downto 0);
signal ram_adr : integer range 0 to 2**ADDRSIZE-1;

begin

	reg_in <= DIN;
	ram_adr <= CONV_INTEGER(ADR);

	process_REG_IN: process(CLK, W_EN, ram_adr, reg_in)
	begin
		if (W_EN = '1') then
			if (rising_edge(CLK)) then
				c_ram(ram_adr) <= reg_in;
			end if;
		end if;
	end process;
	
	process_REG_OUT: process(CLK, RST, R_EN, c_ram, ram_adr)
	begin
		if (RST = '1') then
			reg_out <= (others => '0');
		elsif (R_EN = '1') then
			if (rising_edge(CLK)) then
				reg_out <= c_ram(ram_adr);
			end if;
		end if;
	end process;
	
	DOUT <= reg_out;

end Behavioral;

