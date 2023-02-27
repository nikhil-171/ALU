----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2023 01:55:28 PM
-- Design Name: 
-- Module Name: alu_tester_tb - Behavioral
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

entity alu_tester_tb is
end alu_tester_tb;

architecture testbench of alu_tester_tb is
     signal     tb_button : STD_LOGIC_vector(3 downto 0):= (others => '0');
     signal  	tb_clock :  STD_LOGIC := '0';
     signal  	tb_sw :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
     signal  	tb_led :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');

component alu_tester is
port (button : in STD_LOGIC_Vector(3 downto 0);
       	clock : in STD_LOGIC;
       	sw : in STD_LOGIC_VECTOR (3 downto 0);
       	led : out STD_LOGIC_VECTOR (3 downto 0));
 end component;
 begin
 clk_gen_proc: process
begin
    wait for 4 ns;
    tb_clock <= '1';
    
    wait for 4 ns;
    tb_clock <= '0';
 end process clk_gen_proc;
 
 testing: process
 begin
    wait for 200ns;
    tb_sw <= "0000";
    tb_button <= "0010";
    
    wait for 200 ns;
    tb_sw <= "0001";
    tb_button <= "0001";
    
    wait for 200 ns;
    tb_sw <= "0010";
    tb_button <= "0000";
   
 end process testing;
 
 
dut: alu_tester port map( tb_button, tb_clock, tb_sw, tb_led);
 
end testbench;
