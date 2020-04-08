----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:45 04/08/2020 
-- Design Name: 
-- Module Name:    LINE_OPERATOR - Behavioral 
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

library work;
use work.ConvolutionPack.ALL;

entity LINE_OPERATOR is
	 Generic (LINESIZE : integer := 256;
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  KERNEL_EN : in std_logic;
			  KERNEL_IN : in std_logic_vector(KERNELSIZE*WORD-1 downto 0);
			  KERNEL_SUM : out signed(WORD*2-1 downto 0);
			  LINE_EN : in std_logic;
			  LINE_LENGTH : in integer range 1 to LINESIZE;
			  LINE_IN : in std_logic_vector(WORD-1 downto 0);
			  LINE_OUT : out std_logic_vector(WORD-1 downto 0);
			  CONV_SUM : out signed(3*WORD-1 downto 0)
			  );
end LINE_OPERATOR;

architecture Behavioral of LINE_OPERATOR is

component LINE_REG is
	 Generic (SIZE : integer := 256;
				 OUTSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  EN : in std_logic;
			  LINE_LENGTH : in integer range 1 to SIZE;
			  REG_IN : in std_logic_vector(WORD-1 downto 0);
			  OUTPUT : out std_logic_vector(WORD*OUTSIZE-1 downto 0);
			  LINE_OUT : out std_logic_vector(WORD-1 downto 0)
			  );
end component;

component REG is
	 Generic (N : integer := 8);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           REG_IN : in  STD_LOGIC_VECTOR(N-1 downto 0);
           REG_OUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end component REG;

type t_lvals is array (KERNELSIZE-1 downto 0) of unsigned(WORD-1 downto 0);
type t_kvals is array (KERNELSIZE-1 downto 0) of signed(WORD-1 downto 0);
type t_multiples is array (KERNELSIZE-1 downto 0) of signed(2*WORD downto 0);
type t_sums is array (KERNELSIZE downto 0) of signed(3*WORD-1 downto 0);
type t_ksums is array (KERNELSIZE downto 0) of signed(2*WORD-1 downto 0);

signal lvals: t_lvals;
signal kvals: t_kvals;
signal multiples: t_multiples;
signal sums: t_sums;
signal ksums: t_ksums;
signal kernel_values, line_output: std_logic_vector(KERNELSIZE*WORD-1 downto 0);

constant mzero: signed(3*WORD-1 downto 0) := (others => '0');
constant kzero: signed(2*WORD-1 downto 0) := (others => '0');

begin

kernel_slice: REG generic map(KERNELSIZE*WORD) port map(CLK, RST, KERNEL_EN, KERNEL_IN, kernel_values);
image_line: LINE_REG generic map(LINESIZE, KERNELSIZE, WORD) port map(CLK, RST, LINE_EN, LINE_LENGTH, LINE_IN, line_output, LINE_OUT);

multiplicators: for i in KERNELSIZE downto 1 generate
	lvals(i-1) <= unsigned(line_output(WORD*i-1 downto WORD*(i-1)));
	kvals(i-1) <= signed(kernel_values(WORD*i-1 downto WORD*(i-1)));
	multiples(i-1) <= lvals(i-1)*kvals(i-1);
end generate;

sums(KERNELSIZE) <= mzero;
ksums(KERNELSIZE) <= kzero;

adders: for i in KERNELSIZE-1 downto 0 generate
	sums(i) <= sums(i+1) + multiples(i);
	ksums(i) <= ksums(i+1) + kvals(i);
end generate;

CONV_SUM <= sums(0);
KERNEL_SUM <= ksums(0);

end Behavioral;

