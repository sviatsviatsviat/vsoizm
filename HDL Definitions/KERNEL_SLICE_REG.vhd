----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:11 04/08/2020 
-- Design Name: 
-- Module Name:    KERNEL_SLICE_REG - Behavioral 
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

entity KERNEL_SLICE_REG is
	 Generic (SIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  EN : in std_logic;
			  REG_IN : in std_logic_vector(WORD-1 downto 0);
			  REG_OUT :
			  );
end KERNEL_SLICE_REG;

architecture Behavioral of KERNEL_SLICE_REG is

begin


end Behavioral;

