--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:37:00 04/12/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/VSOIZM/vsoizm/Practice/TB_CONVOLUTION_MODULE_TEST.vhd
-- Project Name:  Practice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONVOLUTION_MODULE
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
USE ieee.numeric_std.ALL;
use std.textio.all;

library work;
use work.ConvolutionPack.all;
 
ENTITY TB_CONVOLUTION_MODULE_TEST IS
END TB_CONVOLUTION_MODULE_TEST;
 
ARCHITECTURE behavior OF TB_CONVOLUTION_MODULE_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONVOLUTION_MODULE
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         KERNEL_EN : IN  std_logic;
         KERNEL_IN : IN  std_logic_vector(7 downto 0);
         KERNEL_SIZE : IN  integer range 0 to 8;
         LINE_EN : IN  std_logic;
         LINE_LENGTH : IN  integer range 0 to 255;
         LINE_IN : IN  std_logic_vector(7 downto 0);
         CONV_RESULT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal KERNEL_EN : std_logic := '0';
   signal KERNEL_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal KERNEL_SIZE : integer range 0 to 8;
   signal LINE_EN : std_logic := '0';
   signal LINE_LENGTH : integer range 0 to 255;
   signal LINE_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal CONV_RESULT : std_logic_vector(7 downto 0);
	
	constant kern_size : integer := 5;
	constant img_size: integer := 253;
	
	signal kernel_mem: mem_array := init_ram_hex("E:\Master Degree\VSOIZM\kernel.hex", kern_size**2);
	signal image_mem: mem_array := init_ram_hex("E:\Master Degree\VSOIZM\image.hex", img_size**2);

	signal bool_started_write: boolean := false;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONVOLUTION_MODULE PORT MAP (
          CLK => CLK,
          RST => RST,
          KERNEL_EN => KERNEL_EN,
          KERNEL_IN => KERNEL_IN,
          KERNEL_SIZE => KERNEL_SIZE,
          LINE_EN => LINE_EN,
          LINE_LENGTH => LINE_LENGTH,
          LINE_IN => LINE_IN,
          CONV_RESULT => CONV_RESULT
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
	
	file test_vector      : text open write_mode is "E:\Master Degree\VSOIZM\output_file.txt";
	variable row          : line;
	
   begin
	
		RST <= '1'; wait for CLK_period;
		RST <= '0';
	
		KERNEL_SIZE <= kern_size-1;
		
		KERNEL_EN <= '1';
		for i in 0 to (kern_size**2)-1 loop
			KERNEL_IN <= kernel_mem(i);
			wait for CLK_period;
		end loop;
		KERNEL_EN <= '0';
		
		LINE_LENGTH <= img_size-1;
		
		LINE_EN <= '1';
		
		for i in 0 to kern_size-1 loop
			
			for j in 0 to img_size-1 loop
				wait for CLK_period;
				LINE_IN <= image_mem(i*img_size+j);
			end loop;
			
		end loop;
		
		bool_started_write <= true;
		for i in kern_size to img_size-1 loop
			
			for j in 0 to img_size-kern_size loop
				write(row, to_integer(unsigned(CONV_RESULT)));
				writeline(test_vector,row);
				wait for CLK_period;
				LINE_IN <= image_mem(i*img_size+j);
			end loop;
			
			for j in img_size-kern_size+1 to img_size-1 loop	
				wait for CLK_period;			
				LINE_IN <= image_mem(i*img_size+j);
			end loop;
			
		end loop;
		
		LINE_IN <= (others => '0');
		for i in 0 to img_size-kern_size loop
				write(row, to_integer(unsigned(CONV_RESULT)));
				writeline(test_vector,row);
				wait for CLK_period;
		end loop;

		LINE_EN <= '0';
		
      wait for CLK_period*2;
		report "End of simulation" severity failure;
   end process;

END;
