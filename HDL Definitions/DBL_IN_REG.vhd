----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:20:54 04/07/2020 
-- Design Name: 
-- Module Name:    DBL_IN_REG - Behavioral 
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

entity DBL_IN_REG is
	 Generic (N : integer := 8);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  IN_SEL : in STD_LOGIC;
			  REG_IN0 : in STD_LOGIC_VECTOR(N-1 downto 0);
           REG_IN1 : in  STD_LOGIC_VECTOR(N-1 downto 0);
           REG_OUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end DBL_IN_REG;

architecture Behavioral of DBL_IN_REG is

component REG is
	 Generic (N : integer := 8);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           REG_IN : in  STD_LOGIC_VECTOR(N-1 downto 0);
           REG_OUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end component REG;

signal reg_in : std_logic_vector(N-1 downto 0);

begin

reg_in <= REG_IN1 when IN_SEL = '1' else REG_IN0;

reg_internal: REG generic map(N) port map(CLK, RST, EN, reg_in, REG_OUT);

end Behavioral;

