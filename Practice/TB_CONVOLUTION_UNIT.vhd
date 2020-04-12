--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:40:54 04/11/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_CONVOLUTION_UNIT.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONVOLUTION_UNIT
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
 
ENTITY TB_CONVOLUTION_UNIT IS
END TB_CONVOLUTION_UNIT;
 
ARCHITECTURE behavior OF TB_CONVOLUTION_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONVOLUTION_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         START : IN  std_logic;
         KERNEL_SIZE : IN  integer range 0 to 8;
         IMAGE_WIDTH : IN  integer range 0 to 255;
         IMAGE_HEIGHT : IN  integer range 0 to 255;
         RES_WIDTH : OUT  integer range 0 to 255;
         RES_HEIGHT : OUT  integer range 0 to 255;
         KERNEL_RW : IN  std_logic;
         IMAGE_RW : IN  std_logic;
         RES_RW : IN  std_logic;
         KERNEL_MEM_IN : IN  std_logic_vector(7 downto 0);
         IMAGE_MEM_IN : IN  std_logic_vector(7 downto 0);
         RES_MEM_OUT : OUT  std_logic_vector(7 downto 0);
         HALT : OUT  std_logic;
         ERROR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal START : std_logic := '0';
   signal KERNEL_SIZE : integer range 0 to 8 := 2;
   signal IMAGE_WIDTH : integer range 0 to 255 := 9;
   signal IMAGE_HEIGHT : integer range 0 to 255 := 9;
   signal KERNEL_RW : std_logic := '0';
   signal IMAGE_RW : std_logic := '0';
   signal RES_RW : std_logic := '1';
   signal KERNEL_MEM_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal IMAGE_MEM_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal RES_WIDTH : integer range 0 to 255;
   signal RES_HEIGHT : integer range 0 to 255;
   signal RES_MEM_OUT : std_logic_vector(7 downto 0);
   signal HALT : std_logic;
   signal ERROR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONVOLUTION_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          START => START,
          KERNEL_SIZE => KERNEL_SIZE,
          IMAGE_WIDTH => IMAGE_WIDTH,
          IMAGE_HEIGHT => IMAGE_HEIGHT,
          RES_WIDTH => RES_WIDTH,
          RES_HEIGHT => RES_HEIGHT,
          KERNEL_RW => KERNEL_RW,
          IMAGE_RW => IMAGE_RW,
          RES_RW => RES_RW,
          KERNEL_MEM_IN => KERNEL_MEM_IN,
          IMAGE_MEM_IN => IMAGE_MEM_IN,
          RES_MEM_OUT => RES_MEM_OUT,
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
      wait for CLK_period/2;

		RST <= '1'; wait for CLK_period;
		RST <= '0'; wait for CLK_period;
		
		START <= '1';
		
		wait until HALT='1' or ERROR='1';

      report "End of simulation" severity failure;
   end process;

END;
