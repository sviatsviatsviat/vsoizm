----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:00 04/12/2020 
-- Design Name: 
-- Module Name:    CONVOLUTION_MODULE - Behavioral 
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


entity CONVOLUTION_MODULE is
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
end CONVOLUTION_MODULE;

architecture Behavioral of CONVOLUTION_MODULE is

component KERNEL is
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
end component KERNEL;

component CONVOLUTION_OPERATOR is
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
end component CONVOLUTION_OPERATOR;

signal kernel_out: std_logic_vector(KERNELSIZE*KERNELSIZE*WORD-1 downto 0);
signal kernel_sum: signed(WORD*2-1 downto 0);

begin

kern: KERNEL generic map(KERNELSIZE, WORD)
	port map(CLK, RST, KERNEL_EN, KERNEL_SIZE, KERNEL_IN, kernel_out, kernel_sum);
	
convolution: CONVOLUTION_OPERATOR generic map(LINESIZE, KERNELSIZE, WORD)
	port map(CLK, RST, kernel_out, kernel_sum, KERNEL_SIZE, LINE_EN, LINE_LENGTH, LINE_IN, CONV_RESULT);

end Behavioral;

