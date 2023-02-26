----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 11:35:32 AM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_tb is
end ripple_adder_tb;

architecture testbench of ripple_adder_tb is


    signal tb_a :  STD_LOGIC_vector (3 downto 0) := (others => '0');
    signal tb_b :  STD_LOGIC_vector (3 downto 0) := (others => '0');
    signal tb_cin :  std_logic := '0';
    signal  tb_y :  std_logic_vector (3 downto 0) := (others => '0');
    signal tb_cout :  STD_LOGIC := '0';

component ripple_adder is
port(
           a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           cin : in std_logic;
           y : out std_logic_vector (3 downto 0);
           cout : out STD_LOGIC);
 end component;
 begin
 adder_proc:process
 begin
    wait for 100 ns;
    tb_cin <= '0';
    tb_a <= "0001";
    tb_b <= "0010";
    
   
    
    wait for 100 ns;
    tb_a <= "1111";
    tb_b <= "1111";
    
   
 end process adder_proc;
 
 
 dut : ripple_adder port map(a => tb_a , b=> tb_b, cin => tb_cin, y=>tb_y, cout => tb_cout);

end testbench;
