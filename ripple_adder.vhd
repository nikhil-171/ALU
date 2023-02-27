----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 11:11:34 AM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
    Port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           cin : in std_logic;
           y : out std_logic_vector (3 downto 0);
           cout : out STD_LOGIC
           );
end ripple_adder;

architecture Behavioral of ripple_adder is

component adder
port (  a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           y : out STD_LOGIC;
           cout : out STD_LOGIC);
   end component;

signal carry : std_logic_vector (3 downto 0);
begin

U1: adder port map(a(0),  b(0), cin , y(0), carry(0));
U2: adder port map(a(1),  b(1), carry(0), y(1), carry(1));
U3: adder port map(a(2),  b(2), carry(1), y(2), carry(2));
U4: adder port map(a(3), b(3), carry(2), y(3), cout);


end Behavioral;
