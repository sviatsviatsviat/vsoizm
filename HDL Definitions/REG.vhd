----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:20 04/07/2020 
-- Design Name: 
-- Module Name:    REG - Behavioral 
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

entity REG is
	 Generic (N : integer := 8);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           REG_IN : in  STD_LOGIC_VECTOR(N-1 downto 0);
           REG_OUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end REG;

architecture Behavioral of REG is

signal reg: std_logic_vector(N-1 downto 0);

begin

processMain: process(RST, CLK, EN, REG_IN)
begin
	if (rst = '1') then
		reg <= (others => '0');
	elsif (EN = '1') then
		if (rising_edge(CLK)) then
			reg <=  REG_IN;
		end if;
	end if;
end process;

REG_OUT <= reg;

end Behavioral;

