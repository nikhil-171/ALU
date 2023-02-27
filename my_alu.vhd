----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2023 11:22:24 AM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity my_alu is
generic ( 
     constant z: natural := 1
   );
    Port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in std_logic_vector (3 downto 0);
           sel : in std_logic_vector (3 downto 0);
           y : out std_logic_vector (3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin

process(a,b,sel)
begin   
    case sel is
            when "0000" => Y <= std_logic_vector(unsigned(a)+unsigned (b));
            when "0001" => Y <=  std_logic_vector(unsigned(a)-unsigned (b));
            when "0010" => Y <=  std_logic_vector(unsigned(a)+1);
            when "0011" => Y <=  std_logic_vector(unsigned(a)-1);
            when "0100" => Y <=  std_logic_vector("0000"-unsigned(a));
            when "0101" => if (unsigned(a)>unsigned (b)) then
                                y <= "0001";
                           else
                                y <= "0000";
                           end if;                                    
            when "0110" => Y <= std_logic_vector (unsigned (a) sll z);
            when "0111" => Y <= std_logic_vector (unsigned (a) srl z);
            when "1000" => Y <= a(3) & a(3 downto 1);
            when "1001" => Y <= not a;
            when "1010" => Y <= a and b;
            when "1011" => Y <= a or b;
            when "1100" => Y <= a xor b;
            when "1101" => Y <= a xnor b;
            when "1110" => Y <= a nand b;
            when "1111" => Y <= a nor b;
            when others => Y <= "0000";
         end case; 
end process;
    
    
    
end Behavioral;
