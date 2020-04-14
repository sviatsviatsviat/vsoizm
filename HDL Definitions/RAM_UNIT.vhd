----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:03 04/11/2020 
-- Design Name: 
-- Module Name:    RAM_UNIT - Behavioral 
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

entity MATRIX_UNIT is
 Generic(
	   MATRIXSIZE: integer := 256;
		MATRIXBITS: integer := 8;
		ADDRSIZE: integer := 16;
		WORD : integer := 8
	 );
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  RW : in std_logic;
			  EN : in std_logic;
           WIDTH : in integer range 0 to MATRIXSIZE-1;
           HEIGHT : in integer range 0 to MATRIXSIZE-1;
			  DONE : out std_logic;
           LINE : out integer range 0 to MATRIXSIZE-1;
           COLUMN : out integer range 0 to MATRIXSIZE-1;
			  DIN : in  std_logic_vector(WORD-1 downto 0);
			  DOUT : out  std_logic_vector(WORD-1 downto 0));
end MATRIX_UNIT;

architecture Behavioral of MATRIX_UNIT is

component RAM_MATRIX_RDR is
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
end component RAM_MATRIX_RDR;

component RAM is
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
end component RAM;

signal addr_wire: STD_LOGIC_VECTOR (ADDRSIZE-1 downto 0);
signal ren, wen: std_logic;

begin

ren <= '1' when RW='0' and EN='1' else '0';
wen <= '1' when RW='1' and EN='1' else '0';

rif: RAM_MATRIX_RDR generic map(MATRIXSIZE, MATRIXBITS, ADDRSIZE, WORD) port map(CLK, RST, EN, WIDTH, HEIGHT, DONE, LINE, COLUMN, addr_wire);
mem: RAM generic map(ADDRSIZE, WORD) port map(CLK, RST, wen, ren, addr_wire, DIN, DOUT);

end Behavioral;

