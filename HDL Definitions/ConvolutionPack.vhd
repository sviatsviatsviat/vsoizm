--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.ALL;
use std.textio.all;

package ConvolutionPack is

constant WORD: integer := 8;

subtype t_word is std_logic_vector(7 downto 0);
type mem_array is array(0 to 256*256-1) of t_word;

impure function init_ram_hex(FileName : STRING; size: integer) return mem_array;
  
end ConvolutionPack;

package body ConvolutionPack is
 
 impure function init_ram_hex(FileName : STRING; size: integer) return mem_array is
  file text_file : text open read_mode is FileName;
  variable text_line : line;
  variable ram_content : mem_array;
  variable c : character;
  variable offset : integer;
  variable hex_val : std_logic_vector(3 downto 0);
begin
  for i in 0 to size - 1 loop
    readline(text_file, text_line);
 
    offset := 0;
 
    while offset < ram_content(i)'high loop
      read(text_line, c);
 
      case c is
        when '0' => hex_val := "0000";
        when '1' => hex_val := "0001";
        when '2' => hex_val := "0010";
        when '3' => hex_val := "0011";
        when '4' => hex_val := "0100";
        when '5' => hex_val := "0101";
        when '6' => hex_val := "0110";
        when '7' => hex_val := "0111";
        when '8' => hex_val := "1000";
        when '9' => hex_val := "1001";
        when 'A' | 'a' => hex_val := "1010";
        when 'B' | 'b' => hex_val := "1011";
        when 'C' | 'c' => hex_val := "1100";
        when 'D' | 'd' => hex_val := "1101";
        when 'E' | 'e' => hex_val := "1110";
        when 'F' | 'f' => hex_val := "1111";
 
        when others =>
          hex_val := "XXXX";
          assert false report "Found non-hex character '" & c & "'";
      end case;
 
      ram_content(i)(ram_content(i)'high - offset
        downto ram_content(i)'high - offset - 3) := hex_val;
      offset := offset + 4;
 
    end loop;
  end loop;
 
  return ram_content;
end function;
 
end ConvolutionPack;