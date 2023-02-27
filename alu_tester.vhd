----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2023 12:10:09 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
    Port (button : in STD_LOGIC_Vector(3 downto 0);
       	clock : in STD_LOGIC;
       	sw : in STD_LOGIC_VECTOR (3 downto 0);
       	led : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is

component my_alu is
port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in std_logic_vector (3 downto 0);
           sel : in std_logic_vector (3 downto 0);
           y : out std_logic_vector (3 downto 0));
           
end component;

 component debounce
port ( button: in std_logic;
   	clock: in std_logic;
   	debounce: out std_logic);
end component;

component clock_div
   port( clock: in std_logic;
     	div: out std_logic);
 end component; 
  

signal op : std_logic_vector (3 downto 0);
signal a_1 : std_logic_vector (3 downto 0);
signal b_1: std_logic_vector (3 downto 0);
signal dbnc: std_logic_vector (3 downto 0);
signal divider: std_logic;

begin
   process(clock)
    begin
        if (rising_edge(clock)) then
            if  dbnc(3) = '1' then
                op <= "0000";
                a_1 <= "0000";
                b_1<= "0000";
            elsif dbnc(2) = '1' then
            op <= sw;   
            elsif dbnc(1) = '1' then
            a_1 <= sw;
            elsif dbnc(0) = '1' then
            b_1 <= sw;
       end if;
       end if;
      end process;
        
A1 : my_alu 
port map (a => a_1, b => b_1, sel => op, y => led) ;

A2: debounce
port map( button => button(0),clock => clock,debounce => dbnc(0));
     	 
A3: debounce
port map( button => button(1),clock => clock,debounce => dbnc(1));
     
A4: debounce
port map( button => button(2),clock => clock,debounce => dbnc(2));
     
A5: debounce
port map( button => button(3),clock => clock,debounce => dbnc(3));

--A6: clock_div
--port map ( clock => clock, div => divider);

end Behavioral;

 