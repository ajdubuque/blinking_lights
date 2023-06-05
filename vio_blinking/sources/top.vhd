library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity top is

    port (clk_in1_p, clk_in1_n, reset, sw_1, sw_2, sw_3, sw_4: in std_logic; 
          l_0, l_1, l_2, l_3, l_4, l_5, l_6, l_7 : out std_logic);
    
end top;

architecture Behavioral of top is

    signal clk : std_logic :='0';
    
    signal ld0 : std_logic := '0';
    signal ld1 : std_logic := '0';
    signal ld2 : std_logic := '0';
    signal ld3 : std_logic := '0';
    signal ld4 : std_logic := '0';
    signal ld5 : std_logic := '0';
    signal ld6 : std_logic := '0';
    signal ld7 : std_logic := '0';
    
    signal sw1 : std_logic := '0';  
    signal sw2 : std_logic := '0';  
    signal sw3 : std_logic := '0';
    signal sw4 : std_logic := '0';
    
    signal counter : integer := 0;
    
    signal rst : std_logic := '0';
    
    component binky_light is
    port ( swtch_1, swtch_2, swtch_3, swtch_4, clk : in std_logic;
           led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7 : out std_logic);     
    end component;
 
    component clk_wiz_1 is
    port(clk_out1 : out std_logic; reset , clk_in1_p , clk_in1_n : in std_logic);
    end component;
    
    COMPONENT vio_0
    PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC;
    probe_in1 : IN STD_LOGIC;
    probe_in2 : IN STD_LOGIC;
    probe_in3 : IN STD_LOGIC;
    probe_out0 : out std_logic;
    probe_out1 : out std_logic;
    probe_out2: out std_logic;
    probe_out3 : out std_logic
  );
  
END COMPONENT;

begin

    clock_controls_1 : clk_wiz_1
    port map (clk_out1 => clk, reset => reset, clk_in1_p => clk_in1_p, clk_in1_n => clk_in1_n);

    led_switch_controls : binky_light                                               --call binky_light, and assign ports from that file to the ports declared here
    port map (led_0 => ld0, led_1 => ld1, led_2 => ld2, led_3 => ld3, 
              led_4 => ld4, led_5 => ld5, led_6 => ld6, led_7 => ld7, 
              swtch_1 => sw1, swtch_2 => sw2, swtch_3 => sw3, swtch_4 => sw4, clk => clk); 
    
    vio_controls : vio_0
    PORT MAP (
    clk => clk,
    probe_in0 => ld0,
    probe_in1 => ld2,
    probe_in2 => ld4,
    probe_in3 => ld6, probe_out0 => sw1, probe_out1 => sw2, probe_out2 => sw3, probe_out3 => sw4);
                        
process( clk)
    begin 
    
    if rising_edge (clk) then 
    
--        sw1 <= sw_1;
--        sw2 <= sw_2;
--        sw3 <= sw_3;
--        sw4 <= sw_4;
        
        l_0 <= ld0;
        l_1 <= ld1;
        l_2 <= ld2;
        l_3 <= ld3;
        l_4 <= ld4;
        l_5 <= ld5;
        l_6 <= ld6;
        l_7 <= ld7;
         
    end if;
    
end process;

end Behavioral;