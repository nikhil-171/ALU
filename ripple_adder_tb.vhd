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

begin 
    signal tb_a : in STD_LOGIC_vector (3 downto 0) := (others => '0');
    signal tb_b : in STD_LOGIC_vector (3 downto 0) := (others => '0');
    signal tb_cin : in std_logic_vector  (3 downto 0) := (others => '0');
    signal  tb_y : out std_logic_vector (3 downto 0) := (others => '0');
    signal tb_cout : out STD_LOGIC_vector (3 downto 0):= (others => '0'));

component ripple_adder is
port(
a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           cin : in std_logic_vector  (3 downto 0);
           y : out std_logic_vector (3 downto 0);
           cout : out STD_LOGIC_vector (3 downto 0));
           
end testbench;
