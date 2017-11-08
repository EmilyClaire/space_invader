


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity EXP8_wrapper_tb is
--  Port ( );
end EXP8_wrapper_tb;

architecture Behavioral of EXP8_wrapper_tb is

   component RAT_Wrapper
   Port(  an     : out   STD_LOGIC_VECTOR (3 downto 0);
           seg    : out   STD_LOGIC_VECTOR (7 downto 0);
          RESET    : in    STD_LOGIC;
          INT      : in STD_LOGIC;
          CLK      : in    STD_LOGIC);
          
    end component;

   signal switches_tb : std_logic_vector(3 downto 0) :="0000";
   signal leds_tb     : std_logic_vector(7 downto 0) :="00000000";
   signal clk_tb : std_logic :=  '0';
   signal rst_tb : std_logic :=  '0';
   signal int_tb : std_logic := '0';
  -- Clock period definitions
  constant CLK_period : time := 10 ns;
  
begin

   uut: RAT_Wrapper PORT MAP (
      seg     => leds_tb,
      an => switches_tb,
      RESET      => rst_tb,
      CLK      => clk_tb,
      INT      => int_tb
   );

   -- Clock process definitions
   CLK_process :process
   begin
        CLK_tb <= '0';
        wait for CLK_period/2;
        CLK_tb <= '1';
        wait for CLK_period/2;
   end process;
   
      -- Stimulus process
   stim_proc: process
   begin       
      rst_tb <= '0';     
      wait for 1000ns;
      int_tb <= '1';
      wait for 3000ns;
      int_tb <= '0';
      wait for 30000ns;
      
--      rst_tb <= '1';
--      wait for 50ns;
--      rst_tb <= '0';
--      wait for 2000ns;
   end process;

end Behavioral;