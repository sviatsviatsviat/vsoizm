--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:34 04/11/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_RAM_MATRIX_RDR.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_MATRIX_RDR
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
 
ENTITY TB_RAM_MATRIX_RDR IS
END TB_RAM_MATRIX_RDR;
 
ARCHITECTURE behavior OF TB_RAM_MATRIX_RDR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_MATRIX_RDR
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         WIDTH : IN  integer range 0 to 255;
         HEIGHT : IN  integer range 0 to 255;
         DONE : OUT  std_logic;
         LINE : OUT  integer range 0 to 255;
         COLUMN : OUT  integer range 0 to 255;
         ADDR : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal WIDTH : integer range 0 to 255 := 5;
   signal HEIGHT : integer range 0 to 255 := 3;

 	--Outputs
   signal DONE : std_logic;
   signal LINE : integer range 0 to 255;
   signal COLUMN : integer range 0 to 255;
   signal ADDR : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_MATRIX_RDR PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          WIDTH => WIDTH,
          HEIGHT => HEIGHT,
          DONE => DONE,
          LINE => LINE,
          COLUMN => COLUMN,
          ADDR => ADDR
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
      -- hold reset state for 100 ns.
      wait for CLK_period/2;	

		RST <= '1'; wait for CLK_period;
		RST <= '0';
		
		EN <= '1';
		
		wait until DONE = '1';
		
		EN <= '0';

      wait for CLK_period*2;
		
		report "End of simulation" severity failure;
   end process;

END;
