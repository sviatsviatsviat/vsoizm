----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:06 04/09/2020 
-- Design Name: 
-- Module Name:    DIVIDER - Behavioral 
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

entity DIVIDER is
		 Generic (
				 WORD : integer := 8
			);
    Port ( 
				VALUE : in  signed (WORD*3-1 downto 0);
				DIVIDER : in  signed (WORD*2-1 downto 0);
				RESULT : out  STD_LOGIC_VECTOR (WORD-1 downto 0)
			 );
end DIVIDER;

architecture Behavioral of DIVIDER is

signal conv_result: signed(WORD*3-1 downto 0);
signal conv_trunc: std_logic_vector(3*WORD-1 downto 0);

constant pixelMax: std_logic_vector(WORD-1 downto 0) := (others => '1');
constant mzero: signed(3*WORD-1 downto 0) := (others => '0');
constant zeros: std_logic_vector(2*WORD-1 downto 0) := (others => '0');

begin

conv_result <= mzero when DIVIDER = mzero else VALUE / DIVIDER;
conv_trunc <= std_logic_vector(conv_result);

processPixeResult: process(conv_result, conv_trunc)
begin
	if (conv_result < mzero) then
		RESULT <= (others => '0');
	elsif (conv_result > signed(zeros & pixelMax)) then
		RESULT <= pixelMax;
	else
		RESULT <= conv_trunc(WORD-1 downto 0);
	end if;
end process;

end Behavioral;

