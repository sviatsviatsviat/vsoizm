--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:05:04 04/09/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_DIVIDER.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DIVIDER
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
USE ieee.numeric_std.ALL;
 
ENTITY TB_DIVIDER IS
END TB_DIVIDER;
 
ARCHITECTURE behavior OF TB_DIVIDER IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DIVIDER
    PORT(
         VALUE : IN  signed(23 downto 0);
         DIVIDER : IN  signed(15 downto 0);
         RESULT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal VALUE : signed(23 downto 0) := (others => '0');
   signal DIVID : signed(15 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DIVIDER PORT MAP (
          VALUE => VALUE,
          DIVIDER => DIVID,
          RESULT => RESULT
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		VALUE <= "111111111111111111110001";
		DIVID <= "0000000000000011";
		
      wait for 50ns;
		
		VALUE <= "000000000000000000001111";
		DIVID <= "0000000000000011";
		
      wait for 50ns;
		
		VALUE <= "000000000000000100101100";
		DIVID <= "0000000000000001";
		
      wait for 50ns;
		
		report "End of simulation" severity failure;
		
   end process;

END;
