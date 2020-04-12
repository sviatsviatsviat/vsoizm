----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:38 04/07/2020 
-- Design Name: 
-- Module Name:    LINE_REG - Behavioral 
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

library work;
use work.ConvolutionPack.ALL;

entity LINE_REG is
	 Generic (SIZE : integer := 256;
				 OUTSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  EN : in std_logic;
			  LINE_LENGTH : in integer range 0 to SIZE-1;
			  REG_IN : in std_logic_vector(WORD-1 downto 0);
			  OUTPUT : out std_logic_vector(WORD*OUTSIZE-1 downto 0);
			  LINE_OUT : out std_logic_vector(WORD-1 downto 0)
			  );
end LINE_REG;

architecture Behavioral of LINE_REG is

component DBL_IN_REG is
	 Generic (N : integer := 8);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  IN_SEL : in STD_LOGIC;
			  REG_IN0 : in STD_LOGIC_VECTOR(N-1 downto 0);
           REG_IN1 : in  STD_LOGIC_VECTOR(N-1 downto 0);
           REG_OUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end component DBL_IN_REG;

type t_wires is array (SIZE downto 0) of std_logic_vector(WORD-1 downto 0);
signal wires : t_wires;
signal input_sel : std_logic_vector(SIZE-1 downto 0);
	
begin

wires(SIZE) <= (others => '0');
LINE_OUT <= wires(0);

regs: for i in SIZE-1 downto 0 generate
	input_sel(i) <= '1' when LINE_LENGTH = i else '0';
	reg: DBL_IN_REG generic map(WORD) port map(CLK, RST, EN, input_sel(i), wires(i+1), REG_IN, wires(i));
end generate;

outputs : for i in OUTSIZE-1 downto 0 generate
  OUTPUT(WORD*(i+1)-1 downto WORD*i) <= wires(i);
end generate; 

end Behavioral;

