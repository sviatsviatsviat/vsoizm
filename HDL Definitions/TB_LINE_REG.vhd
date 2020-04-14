--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:49:57 04/08/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_LINE_REG.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LINE_REG
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_LINE_REG IS
END TB_LINE_REG;
 
ARCHITECTURE behavior OF TB_LINE_REG IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LINE_REG
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         LINE_LENGTH : IN integer range 1 to 256;
         REG_IN : IN  std_logic_vector(7 downto 0);
         OUTPUT : OUT  std_logic_vector(71 downto 0);
         LINE_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal LINE_LENGTH : integer range 1 to 256 := 1;
   signal REG_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(71 downto 0);
   signal LINE_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LINE_REG PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          LINE_LENGTH => LINE_LENGTH,
          REG_IN => REG_IN,
          OUTPUT => OUTPUT,
          LINE_OUT => LINE_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
				
		wait for CLK_period/2;
		
		RST <= '1'; wait for CLK_period;
		RST <= '0'; wait for CLK_period;
		
		LINE_LENGTH <= 12;
		
		REG_IN <= (others => '0');
		EN <= '1';
		for i in 1 to 25 loop
		
			wait for CLK_period;
			REG_IN <= conv_std_logic_vector(i, 8);
		
		end loop;
		
		EN <= '0';
		wait for CLK_period*5;
		
		report "End of simulition" severity failure;
   end process;

END;
