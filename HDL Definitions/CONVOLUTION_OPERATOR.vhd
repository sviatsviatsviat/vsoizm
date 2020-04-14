----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:06 04/09/2020 
-- Design Name: 
-- Module Name:    CONVOLUTION_OPERATOR - Behavioral 
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

library work;
use work.ConvolutionPack.ALL;

entity CONVOLUTION_OPERATOR is
	 Generic (LINESIZE : integer := 256;
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
			);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  KERNEL_IN : in std_logic_vector(KERNELSIZE*KERNELSIZE*WORD-1 downto 0);
			  KERNEL_SUM : in signed(WORD*2-1 downto 0);
			  KERNEL_SIZE : in integer range 0 to KERNELSIZE-1;
			  LINE_EN : in std_logic;
			  LINE_LENGTH : in integer range 0 to LINESIZE-1;
			  LINE_IN : in std_logic_vector(WORD-1 downto 0);
			  CONV_RESULT: out std_logic_vector(WORD-1 downto 0)
			  );
end CONVOLUTION_OPERATOR;

architecture Behavioral of CONVOLUTION_OPERATOR is

component LINE_OPERATOR is
	 Generic (LINESIZE : integer := 256;
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  KERNEL_IN : in std_logic_vector(KERNELSIZE*WORD-1 downto 0);
			  LINE_EN : in std_logic;
			  LINE_LENGTH : in integer range 0 to LINESIZE-1;
			  LINE_IN : in std_logic_vector(WORD-1 downto 0);
			  LINE_OUT : out std_logic_vector(WORD-1 downto 0);
			  CONV_SUM : out signed(3*WORD-1 downto 0)
			  );
end component LINE_OPERATOR;

component DIVIDER is
		 Generic (
				 WORD : integer := 8
			);
    Port ( 
				VALUE : in  signed (WORD*3-1 downto 0);
				DIVIDER : in  signed (WORD*2-1 downto 0);
				RESULT : out  STD_LOGIC_VECTOR (WORD-1 downto 0)
			 );
end component DIVIDER;

type t_conv_sums is array(KERNELSIZE-1 downto 0) of signed(3*WORD-1 downto 0);
type t_conv_ttl is array (KERNELSIZE downto 0) of signed(3*WORD-1 downto 0);
type t_line_ins is array(KERNELSIZE-1 downto 0) of std_logic_vector(WORD-1 downto 0);
type t_line_outs is array(KERNELSIZE downto 0) of std_logic_vector(WORD-1 downto 0);

signal conv_sums: t_conv_sums;
signal conv_ttl: t_conv_ttl;
signal line_ins: t_line_ins; 
signal line_outs: t_line_outs;

constant mzero: signed(3*WORD-1 downto 0) := (others => '0');

begin

conv_ttl(KERNELSIZE) <= mzero;
line_outs(KERNELSIZE) <= (others => '0');

line_ops: for i in KERNELSIZE-1 downto 0 generate
	line_ins(i) <= LINE_IN when KERNEL_SIZE = i else line_outs(i+1);
	line_op: LINE_OPERATOR generic map(LINESIZE, KERNELSIZE, WORD) port map(CLK, RST, KERNEL_IN((i+1)*KERNELSIZE*WORD-1 downto i*KERNELSIZE*WORD), LINE_EN, LINE_LENGTH, line_ins(i), line_outs(i), conv_sums(i));
end generate;

adders: for i in KERNELSIZE-1 downto 0 generate
	conv_ttl(i) <= conv_ttl(i+1) + conv_sums(i);
end generate;

div: DIVIDER generic map(WORD) port map(conv_ttl(0), KERNEL_SUM, CONV_RESULT);

end Behavioral;

