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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.ConvolutionPack.ALL;

entity KERNEL is
	 Generic (
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           LINE : in integer range KERNELSIZE-1 downto 0;
           COLUMN : in integer range KERNELSIZE-1 downto 0;
           KERNEL_IN : in  STD_LOGIC_VECTOR (WORD-1 downto 0);
           KERNEL_OUT : out t_bus(KERNELSIZE-1 downto 0)(KERNELSIZE*WORD-1 downto 0)
			  );
end KERNEL;

architecture Behavioral of KERNEL is

begin

main: process(CLK, RST, EN, LINE, COLUMN, KERNEL_IN)
begin
	if (RST = '1') then
		KERNEL_OUT <= (others => (others => '0'));
	--elsif (EN = '1')
		--KERNEL_OUT(LINE)((COLUMN+1)*WORD-1 downto COLUMN*WORD) <= KERNEL_IN;
	end if;
end process;

end Behavioral;

