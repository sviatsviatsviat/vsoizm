--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:13:29 04/08/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_LINE_OPERATOR.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LINE_OPERATOR
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
use IEEE.NUMERIC_STD.ALL;
 
ENTITY TB_LINE_OPERATOR IS
END TB_LINE_OPERATOR;
 
ARCHITECTURE behavior OF TB_LINE_OPERATOR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LINE_OPERATOR
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         KERNEL_EN : IN  std_logic;
         KERNEL_IN : IN  std_logic_vector(71 downto 0);
         KERNEL_SUM : OUT signed(15 downto 0);
         LINE_EN : IN  std_logic;
         LINE_LENGTH : IN integer range 1 to 256;
         LINE_IN : IN  std_logic_vector(7 downto 0);
         LINE_OUT : OUT  std_logic_vector(7 downto 0);
         CONV_SUM : OUT  signed(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal KERNEL_EN : std_logic := '0';
   signal KERNEL_IN : std_logic_vector(71 downto 0) := (others => '0');
   signal LINE_EN : std_logic := '0';
   signal LINE_LENGTH : integer range 1 to 256 := 12;
   signal LINE_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal KERNEL_SUM : signed(15 downto 0);
   signal LINE_OUT : std_logic_vector(7 downto 0);
   signal CONV_SUM : signed(23 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	constant core : std_logic_vector(7 downto 0) := "11111011";
	constant neiborgs : std_logic_vector(7 downto 0) := "00000011";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LINE_OPERATOR PORT MAP (
          CLK => CLK,
          RST => RST,
          KERNEL_EN => KERNEL_EN,
          KERNEL_IN => KERNEL_IN,
          KERNEL_SUM => KERNEL_SUM,
          LINE_EN => LINE_EN,
          LINE_LENGTH => LINE_LENGTH,
          LINE_IN => LINE_IN,
          LINE_OUT => LINE_OUT,
          CONV_SUM => CONV_SUM
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
		
		KERNEL_IN(23 downto 0) <= neiborgs & core & neiborgs;
		KERNEL_EN <= '1'; wait for CLK_period;
		KERNEL_EN <= '0';
		
		LINE_IN <= (others => '0');
		LINE_EN <= '1';
		for i in 1 to 25 loop
		
			wait for CLK_period;
			LINE_IN <= std_logic_vector(to_unsigned(i, 8));
		
		end loop;
		
		LINE_EN <= '0';
		wait for CLK_period*5;
		
		report "End of simulition" severity failure;
   end process;

END;
