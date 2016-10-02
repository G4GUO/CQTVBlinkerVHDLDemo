library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CQTVBlinkerVHDLDemo is 
port(  
  clk50mhz : in  std_logic;
  button   : in  std_logic;
  LED1     : out std_logic;
  LED2     : out std_logic;
  LED3     : out std_logic
);
end CQTVBlinkerVHDLDemo;

architecture main of CQTVBlinkerVHDLDemo is 
signal counter: STD_LOGIC_VECTOR (31 downto 0);
signal leds: STD_LOGIC_VECTOR (2 downto 0);
begin       
clock_update : process( clk50mhz, counter, leds )
begin
     if rising_edge(clk50mhz) then
	    counter <= counter + 1;
       case  button & counter(24 downto 23)  is
          when  "000" =>  leds <= "001";
          when  "001" =>  leds <= "010";
          when  "010" =>  leds <= "100";
          when  "011" =>  leds <= "000";              
          when  "100" =>  leds <= "100";
          when  "101" =>  leds <= "010";
          when  "110" =>  leds <= "001";
          when  "111" =>  leds <= "000";              
          when others =>  leds <= "000";
       end case;
     end if;  
     LED1    <=  not leds(0);
     LED2    <=  not leds(1);
     LED3    <=  not leds(2);
end process;
end main;