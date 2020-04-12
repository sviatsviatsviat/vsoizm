----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:26 04/09/2020 
-- Design Name: 
-- Module Name:    KERNEL - Behavioral 
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

entity KERNEL is
	 Generic (
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           SIZE : in integer range 0 to KERNELSIZE-1;
           KERNEL_IN : in STD_LOGIC_VECTOR (WORD-1 downto 0);
           KERNEL_OUT : out std_logic_vector(KERNELSIZE*KERNELSIZE*WORD-1 downto 0);
			  KERNEL_SUM : out signed(WORD*2-1 downto 0)
			  );
end KERNEL;

architecture Behavioral of KERNEL is

component LINE_REG is
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
end component LINE_REG;

signal slice_outs: std_logic_vector(KERNELSIZE*KERNELSIZE*WORD-1 downto 0);

type t_slice_in is array(KERNELSIZE-1 downto 0) of std_logic_vector(WORD-1 downto 0);
signal slice_in: t_slice_in;

type t_slice_out is array(KERNELSIZE downto 0) of std_logic_vector(WORD-1 downto 0);
signal slice_out: t_slice_out;

type t_ksums is array (KERNELSIZE**2 downto 0) of signed(2*WORD-1 downto 0);
signal ksums: t_ksums;

type t_kvals is array (KERNELSIZE**2-1 downto 0) of signed(WORD-1 downto 0);
signal kvals: t_kvals; 

constant kzero: signed(2*WORD-1 downto 0) := (others => '0');

begin

slice_out(KERNELSIZE) <= (others => '0');
ksums(KERNELSIZE**2) <= kzero;

g0: for i in KERNELSIZE-1 downto 0 generate
	slice_in(i) <= KERNEL_IN when SIZE = i else slice_out(i+1);
	kernel_slice: LINE_REG generic map(KERNELSIZE, KERNELSIZE, WORD) port map(CLK, RST, EN, SIZE, slice_in(i), slice_outs((i+1)*KERNELSIZE*WORD-1 downto i*KERNELSIZE*WORD), slice_out(i));
end generate;

g1: for i in KERNELSIZE**2-1 downto 0 generate
	kvals(i) <= signed(slice_outs((i+1)*WORD-1 downto i*WORD));
end generate;

g2: for i in KERNELSIZE**2-1 downto 0 generate
	ksums(i) <= ksums(i+1) + kvals(i);
end generate;

KERNEL_OUT <= slice_outs;
KERNEL_SUM <= ksums(0);

end Behavioral;

