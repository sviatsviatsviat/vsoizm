--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:42:45 04/08/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_DBL_IN_REG.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DBL_IN_REG
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_DBL_IN_REG IS
END TB_DBL_IN_REG;
 
ARCHITECTURE behavior OF TB_DBL_IN_REG IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DBL_IN_REG
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         IN_SEL : IN  std_logic;
         REG_IN0 : IN  std_logic_vector(7 downto 0);
         REG_IN1 : IN  std_logic_vector(7 downto 0);
         REG_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal IN_SEL : std_logic := '0';
   signal REG_IN0 : std_logic_vector(7 downto 0) := (others => '0');
   signal REG_IN1 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal REG_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DBL_IN_REG PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          IN_SEL => IN_SEL,
          REG_IN0 => REG_IN0,
          REG_IN1 => REG_IN1,
          REG_OUT => REG_OUT
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
		
		REG_IN0 <= "00001111";
		REG_IN1 <= "11110000";
		
		wait for CLK_period;
		
		RST <= '1'; wait for CLK_period;
		RST <= '0'; wait for CLK_period;
		
		EN <= '1'; wait for CLK_period;
		EN <= '0'; IN_SEL <= '1'; wait for CLK_period;
		
		EN <= '1'; wait for CLK_period*2;
		
		report "End of simulition" severity failure;
   end process;

END;
