----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:09 04/11/2020 
-- Design Name: 
-- Module Name:    RAM_MATRIX_RDR - Behavioral 
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

entity RAM_MATRIX_RDR is
    Generic(
	   MATRIXSIZE: integer := 256;
		MATRIXBITS: integer := 8;
		ADDRSIZE: integer := 16;
		WORD : integer := 8
	 );
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  EN : in std_logic;
           WIDTH : in integer range 0 to MATRIXSIZE-1;
           HEIGHT : in integer range 0 to MATRIXSIZE-1;
			  DONE : out std_logic;
           LINE : out integer range 0 to MATRIXSIZE-1;
           COLUMN : out integer range 0 to MATRIXSIZE-1;
           ADDR : out  STD_LOGIC_VECTOR (ADDRSIZE-1 downto 0));
end RAM_MATRIX_RDR;

architecture Behavioral of RAM_MATRIX_RDR is

signal curr_addr, next_addr: unsigned(ADDRSIZE-1 downto 0);
signal width_wire, height_wire, line_wire, column_wire: unsigned(MATRIXBITS downto 0);

begin

width_wire <= to_unsigned(WIDTH, MATRIXBITS+1)+1;
height_wire <= to_unsigned(HEIGHT, MATRIXBITS+1)+1; 

LINE <= to_integer(curr_addr/width_wire);
COLUMN <= to_integer(curr_addr mod width_wire);
DONE <= '1' when curr_addr = width_wire*height_wire else '0';

paddr: process(CLK, RST, EN, WIDTH, HEIGHT, next_addr)
begin
	if (RST = '1') then
		curr_addr <= (others => '0');
		next_addr <= (others => '0');
	elsif (EN = '1') then
		if (rising_edge(CLK)) then
			curr_addr <= next_addr;
		end if;
		if (falling_edge(CLK)) then
			next_addr <= next_addr+1;
		end if;
	end if;
end process;

ADDR <= std_logic_vector(curr_addr);

end Behavioral;

