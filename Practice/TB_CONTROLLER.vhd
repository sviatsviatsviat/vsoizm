--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:47:28 04/11/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_CONTROLLER.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROLLER
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
 
ENTITY TB_CONTROLLER IS
END TB_CONTROLLER;
 
ARCHITECTURE behavior OF TB_CONTROLLER IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROLLER
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         START : IN  std_logic;
         KERNEL_DONE : IN  std_logic;
         KERNEL_EN : OUT  std_logic;
         KERNEL_SIZE : IN  integer range 0 to 8;
         KERNEL_LINE : IN  integer range 0 to 8;
         KERNEL_COL : IN  integer range 0 to 8;
         IMAGE_WIDTH : IN  integer range 0 to 255;
         IMAGE_HEIGHT : IN  integer range 0 to 255;
         LINE_EN : OUT  std_logic;
         LINE_DONE : IN  std_logic;
         LINE_LINE : IN  integer range 0 to 255;
         LINE_COL : IN  integer range 0 to 255;
         CONV_EN : OUT  std_logic;
         RES_EN : OUT  std_logic;
         RES_DONE : IN  std_logic;
         RES_LINE : IN  integer range 0 to 255;
         RES_COL : IN  integer range 0 to 255;
         RES_WIDTH : OUT  integer range 0 to 255;
         RES_HEIGHT : OUT  integer range 0 to 255;
         HALT : OUT  std_logic;
         ERROR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal START : std_logic := '0';
   signal KERNEL_DONE : std_logic := '0';
   signal KERNEL_SIZE : integer range 0 to 8 := 2;
   signal KERNEL_LINE : integer range 0 to 8 := 0;
   signal KERNEL_COL : integer range 0 to 8 := 0;
   signal IMAGE_WIDTH : integer range 0 to 255 := 10;
   signal IMAGE_HEIGHT : integer range 0 to 255 := 5;
   signal LINE_DONE : std_logic := '0';
   signal LINE_LINE : integer range 0 to 255 := 0;
   signal LINE_COL : integer range 0 to 255 := 0;
   signal RES_DONE : std_logic := '0';
   signal RES_LINE : integer range 0 to 255 := 0;
   signal RES_COL : integer range 0 to 255 := 0;

 	--Outputs
   signal KERNEL_EN : std_logic;
   signal LINE_EN : std_logic;
   signal CONV_EN : std_logic;
   signal RES_EN : std_logic;
   signal RES_WIDTH : integer range 0 to 255;
   signal RES_HEIGHT : integer range 0 to 255;
   signal HALT : std_logic;
   signal ERROR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROLLER PORT MAP (
          CLK => CLK,
          RST => RST,
          START => START,
          KERNEL_DONE => KERNEL_DONE,
          KERNEL_EN => KERNEL_EN,
          KERNEL_SIZE => KERNEL_SIZE,
          KERNEL_LINE => KERNEL_LINE,
          KERNEL_COL => KERNEL_COL,
          IMAGE_WIDTH => IMAGE_WIDTH,
          IMAGE_HEIGHT => IMAGE_HEIGHT,
          LINE_EN => LINE_EN,
          LINE_DONE => LINE_DONE,
          LINE_LINE => LINE_LINE,
          LINE_COL => LINE_COL,
          CONV_EN => CONV_EN,
          RES_EN => RES_EN,
          RES_DONE => RES_DONE,
          RES_LINE => RES_LINE,
          RES_COL => RES_COL,
          RES_WIDTH => RES_WIDTH,
          RES_HEIGHT => RES_HEIGHT,
          HALT => HALT,
          ERROR => ERROR
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
      wait for 100 ns;	

      wait for CLK_period*10;

      report "End of simulation" severity failure;
   end process;

END;
