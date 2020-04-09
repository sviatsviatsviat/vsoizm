----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:49:41 04/09/2020 
-- Design Name: 
-- Module Name:    KERNEL_SLICE_IF - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity KERNEL_SLICE_IF is
	 Generic (
				 KERNELSIZE : integer := 9;
				 WORD : integer := 8
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           POS : in integer range KERNELSIZE-1 downto 0;
           REG_IN : in  STD_LOGIC_VECTOR (WORD-1 downto 0);
           REG_OUT : in  STD_LOGIC_VECTOR (WORD*KERNELSIZE-1 downto 0)
			  );
end KERNEL_SLICE_IF;

architecture Behavioral of KERNEL_SLICE_IF is

begin

end Behavioral;

