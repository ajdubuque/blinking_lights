library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity binky_light is

    port ( swtch_1, swtch_2, swtch_3, swtch_4, clk : in std_logic;
           led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7 : out std_logic);
            
end binky_light;

architecture Behavioral of binky_light is

    signal sw1 : std_logic := '0';  --set signal for each port, and initialize; will reference signals from now on 
    signal sw2 : std_logic := '0';  --signals will receive port information and pass it along 
    signal sw3 : std_logic := '0';
    signal sw4 : std_logic := '0';
  
    signal ld0 : std_logic := '0';
    signal ld1 : std_logic := '0';
    signal ld2 : std_logic := '0';
    signal ld3 : std_logic := '0';
    signal ld4 : std_logic := '0';
    signal ld5 : std_logic := '0';
    signal ld6 : std_logic := '0';
    signal ld7 : std_logic := '0';
   
    signal rst : std_logic := '0';
    
    signal toggle0 : std_logic := '0';
    signal toggle1 : std_logic := '0';
    signal toggle2 : std_logic := '0';
    signal toggle3 : std_logic := '0';

begin

div_0 : process (clk)
    variable counter0 : integer range 0 to 100000000;
    begin 
    
    if rising_edge (clk) then 
        if (rst = '1') then 
            counter0 := 100000000;
        elsif (counter0 = 0) then 
            counter0 :=100000000;
            toggle0 <= not toggle0;
        else 
            counter0 := counter0 - 1;
        end if;
     end if;
 end process div_0;  
        
div_1 : process (clk)
    variable counter1 : integer range 0 to 50000000;
    begin 
    
    if rising_edge (clk) then 
        if (rst = '1') then 
            counter1 := 50000000;
        elsif (counter1 = 0) then 
            counter1 :=50000000;
            toggle1 <= not toggle1;
        else 
            counter1 := counter1 - 1;
        end if;
     end if;
 end process div_1;  
 
 div_2 : process (clk)
    variable counter2 : integer range 0 to 20000000;
    begin 
    
    if rising_edge (clk) then 
        if (rst = '1') then 
            counter2 := 20000000;
        elsif (counter2 = 0) then 
            counter2 :=20000000;
            toggle2 <= not toggle2;
        else 
            counter2 := counter2 - 1;
        end if;
     end if;
 end process div_2;  
 
 div_3 : process (clk)
    variable counter3 : integer range 0 to 10000000;
    begin 
    
    if rising_edge (clk) then 
        if (rst = '1') then 
            counter3 := 10000000;
        elsif (counter3 = 0) then 
            counter3 :=10000000;
            toggle3 <= not toggle3;
        else 
            counter3 := counter3 - 1;
        end if;
     end if;
 end process div_3;  
 
process (swtch_1, swtch_2, swtch_3, swtch_4, clk) --most processes involve the clock, and here we include all the input ports 
    begin 
    
--   if (rst = '1') then 
--    counter <= 0;
--    rst <= '0';
--   end if;
 
    
    if rising_edge(clk) then --rising_edge means if clk'event and clk = '1' then ... 
    
        --counter <= counter + 1; 
        --counter <= counter + 1; 
     
    
        sw1 <= swtch_1;     --when switch is physically activated, then send that information to the corresponding signal 
        sw2 <= swtch_2;
        sw3 <= swtch_3;
        sw4 <= swtch_4;
        
        if (sw1 = '1') then
            if (toggle0 = '1') then 
            ld0 <= '1'; 
            ld1 <= '1';    --if the switch signal is 'on' then make it so that the led signals are also on (2 for each)
        else
            ld0 <= '0';
            ld1 <= '0';     
            end if;      
        end if;
            
        if (sw2 = '1') then
            if (toggle1 = '1') then 
            ld2 <= '1' ;
            ld3 <= '1' ;  
        else
            ld2 <= '0';
            ld3 <= '0';  
            end if;
        end if;
              
        if (sw3 = '1') then
            if (toggle2 = '1') then 
            ld4 <= '1' ;
            ld5 <= '1' ;
        else
            ld4 <= '0';
            ld5 <= '0'; 
            end if; 
        end if;
             
        if (sw4 = '1') then
            if (toggle3 = '1') then 
            ld6 <= '1' ; 
            ld7 <= '1' ;
        else
            ld6 <= '0';
            ld7 <= '0';  
            end if;
        end if;
        
--        if (counter = 200000000) then 
--            counter <= 0;
--        end if;
      --rst <= '1';
      
--        if (sw1 = '0') then 
--            ld0 <= '0' ;
--            ld1 <= '0' ;   --if the switch signal is 'off' then make it so that the led signals are also on (2 for each)
--        end if;
            
--        if (sw2 = '0') then 
--            ld2 <= '0' ;
--            ld3 <= '0' ;      
--        end if;
              
--        if (sw3 = '0') then 
--            ld4 <= '0' ;
--            ld5 <= '0' ;      
--        end if;
             
--        if (sw4 = '0') then 
--            ld6 <= '0' ; 
--            ld7 <= '0' ;
--        end if;

--        if (sw1 = '1') then 
--            ld0 <= '1';
--            ld1 <= '1';
--            if (counter (5) = '1') or (sw1 = '0') then 
--                ld0 <= '0';
--                ld1 <= '0';
--            end if;
--        end if;   
        
       led_0 <= ld0;
       led_1 <= ld1;
       led_2 <= ld2;
       led_3 <= ld3;
       led_4 <= ld4;
       led_5 <= ld5;
       led_6 <= ld6;
       led_7 <= ld7;
       
     end if;
    
end process;

end Behavioral;

