----------------------------------------------------------------------------------
-- Company:  RAT Technologies (a subdivision of Cal Poly CENG)
-- Engineer:  Various RAT rats
--
-- Create Date:    02/03/2017
-- Module Name:    RAT_wrapper - Behavioral
-- Target Devices:  Basys3
-- Description: Wrapper for RAT CPU. This model provides a template to interfaces
--    the RAT CPU to the Basys3 development board.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAT_wrapper is
    Port ( --LEDS     : out   STD_LOGIC_VECTOR (7 downto 0);
             an     : out   STD_LOGIC_VECTOR (3 downto 0);
             seg    : out   STD_LOGIC_VECTOR (7 downto 0);
           --SWITCHES : in    STD_LOGIC_VECTOR (7 downto 0);
           RESET    : in    STD_LOGIC;
           L_INT      : in    STD_LOGIC;
           CLK      : in    STD_LOGIC;
           
           
           VGA_RGB  : out std_logic_vector(7 downto 0);
          VGA_HS   : out std_logic;
          VGA_VS   : out std_logic);
end RAT_wrapper;

architecture Behavioral of RAT_wrapper is

   -- INPUT PORT IDS -------------------------------------------------------------
   -- Right now, the only possible inputs are the switches
   -- In future labs you can add more port IDs, and you'll have
   -- to add constants here for the mux below
   --CONSTANT SWITCHES_ID : STD_LOGIC_VECTOR (7 downto 0) := X"20";
   -------------------------------------------------------------------------------
   
   -------------------------------------------------------------------------------
   -- OUTPUT PORT IDS ------------------------------------------------------------
   -- In future labs you can add more port IDs
   CONSTANT LEDS_ID       : STD_LOGIC_VECTOR (7 downto 0) := x"40";
   CONSTANT SSEG_CNTR_ID : STD_LOGIC_VECTOR (7 downto 0) := x"60";
   CONSTANT SSEG_VAL_ID:    STD_LOGIC_VECTOR (7 downto 0) := x"80";
   
   
   CONSTANT INTERRUPT_LEFT_ID : STD_LOGIC_VECTOR (7 downto 0) := x"20";
   CONSTANT INTERRUPT_RIGHT_ID : STD_LOGIC_VECTOR (7 downto 0) := x"21";
   CONSTANT INTERRUPT_SHOOT_ID : STD_LOGIC_VECTOR (7 downto 0) := x"22";
   
   CONSTANT VGA_READ_ID : STD_LOGIC_VECTOR(7 downto 0) := x"93";
   CONSTANT VGA_HADDR_ID : STD_LOGIC_VECTOR(7 downto 0) := x"90";
   CONSTANT VGA_LADDR_ID : STD_LOGIC_VECTOR(7 downto 0) := x"91";
   CONSTANT VGA_WRITE_ID : STD_LOGIC_VECTOR(7 downto 0) := x"92";   
   -------------------------------------------------------------------------------

   -- Declare RAT_CPU ------------------------------------------------------------
   component RAT_CPU
       Port ( IN_PORT  : in  STD_LOGIC_VECTOR (7 downto 0);
              OUT_PORT : out STD_LOGIC_VECTOR (7 downto 0);
              PORT_ID  : out STD_LOGIC_VECTOR (7 downto 0);
              IO_STRB  : out STD_LOGIC;
              RST    : in  STD_LOGIC;
              INT   : in  STD_LOGIC;
              CLK      : in  STD_LOGIC);
   end component RAT_CPU;
   
   
--   component PmodJSTK_Demo
--   Port(
--       CLK : in std_logic;
--       RST : in std_logic;
--       MISO : in std_logic;
--        SW : in std_logic_vector (2 downto 0);
--       SS : out std_logic;
--       MOSI : out std_logic;
--       SCLK : out std_logic;
--       LED : out std_logic_vector (2 downto 0);
--        AN : out std_logic_vector (3 downto 0);
--        SEG : out std_logic_vector (6 downto 0));
--      end component;
   
   
   
   component clk_div 
       Port (       CLK : in std_logic;
                   FCLK : out std_logic);
   end component;
   
   
   component vgaDriverBuffer is
      Port (CLK, we : in std_logic;
            wa   : in std_logic_vector (10 downto 0);
            wd   : in std_logic_vector (7 downto 0);
            Rout : out std_logic_vector(2 downto 0);
            Gout : out std_logic_vector(2 downto 0);
            Bout : out std_logic_vector(1 downto 0);
            HS   : out std_logic;
            VS   : out std_logic;
            pixelData : out std_logic_vector(7 downto 0));
   end component;
   
   
   component sseg_dec_uni
       Port (       COUNT1 : in std_logic_vector(13 downto 0); 
                    COUNT2 : in std_logic_vector(7 downto 0);
                       SEL : in std_logic_vector(1 downto 0);
                     dp_oe : in std_logic;
                        dp : in std_logic_vector(1 downto 0);                       
                       CLK : in std_logic;
                      SIGN : in std_logic;
                     VALID : in std_logic;
                   DISP_EN : out std_logic_vector(3 downto 0);
                  SEGMENTS : out std_logic_vector(7 downto 0));
   end component sseg_dec_uni;
   
   
   
   component db_1shot_FSM is
       Port ( A    : in STD_LOGIC;
              CLK  : in STD_LOGIC;
              A_DB : out STD_LOGIC);
   end component db_1shot_FSM;
   
   
   -------------------------------------------------------------------------------

   -- Signals for connecting RAT_CPU to RAT_wrapper -------------------------------
   signal s_input_port  : std_logic_vector (7 downto 0);
   signal s_output_port : std_logic_vector (7 downto 0);
   signal s_port_id     : std_logic_vector (7 downto 0) := x"20";
   signal s_load        : std_logic;
   signal s_sseg_cntr   : std_logic_vector (7 downto 0);
   signal s_sseg_val    : std_logic_vector (7 downto 0);
   signal s_cnt1_assign : std_logic_vector (13 downto 0);
   signal s_dbn_int     : std_logic;
   signal s_clk         : std_logic;
   --signal s_interrupt   : std_logic; -- not yet used
   
   
      signal r_vga_we   : std_logic;                       -- Write enable
   signal r_vga_wa   : std_logic_vector(10 downto 0);   -- The address to read from / write to  
   signal r_vga_wd   : std_logic_vector(7 downto 0);    -- The pixel data to write to the framebuffer
   signal r_vgaData  : std_logic_vector(7 downto 0);    -- The pixel data read from the framebuffer
   
   
   
   -- Register definitions for output devices ------------------------------------
   -- add signals for any added outputs
   signal r_LEDS        : std_logic_vector (7 downto 0);
   -------------------------------------------------------------------------------

begin


   -- Instantiate RAT_CPU --------------------------------------------------------
   CPU: RAT_CPU
   port map(  IN_PORT  => s_input_port,
              OUT_PORT => s_output_port,
              PORT_ID  => s_port_id,
              RST    => RESET,
              IO_STRB  => s_load,
              INT   => s_dbn_int,  -- s_interrupt
              CLK      => s_CLK);
              
     
    s_cnt1_assign <= "000000" & s_SSEG_val;
    
    my_sseg_dec_uni : sseg_dec_uni
    port map (       COUNT1 => s_cnt1_assign,
                     COUNT2 => s_sseg_val,
                     SEL => s_SSEG_cntr (7 downto 6),
                     dp_oe => s_sseg_cntr(2),
                     dp => s_sseg_cntr (5 downto 4),                       
                     CLK => CLK,
                     SIGN => s_sseg_cntr(1),
                     VALID => s_sseg_cntr(0),
                     DISP_EN => an,
                     SEGMENTS => seg);
              
        my_clk_div : clk_div 
             port map (CLK => CLK,
                       FCLK => s_clk
                       );
          
   VGA: vgaDriverBuffer
                                               port map(CLK => CLK,
                                                        WE => r_vga_we,
                                                        WA => r_vga_wa,
                                                        WD => r_vga_wd,
                                                        Rout => VGA_RGB(7 downto 5),
                                                        Gout => VGA_RGB(4 downto 2),
                                                        Bout => VGA_RGB(1 downto 0),
                                                        HS => VGA_HS,
                                                        VS => VGA_VS,
                                                        pixelData => r_vgaData);     
              
              
    my_db_1shot_FSM : db_1shot_FSM 
        port map ( A    => L_INT,
                   CLK  => s_clk,
                   A_DB => s_dbn_int);
                                   
   -------------------------------------------------------------------------------


   -------------------------------------------------------------------------------
   -- MUX for selecting what input to read ---------------------------------------
   -- add conditions and connections for any added PORT IDs
   -------------------------------------------------------------------------------
--   inputs: process(s_port_id, SWITCHES)
--   begin
--      if (s_port_id  = SWITCHES_ID) then
--         s_input_port <= SWITCHES;
--      else
--         s_input_port <= x"00";
--      end if;
--   end process inputs;
   -------------------------------------------------------------------------------


   -------------------------------------------------------------------------------
   -- MUX for updating output registers ------------------------------------------
   -- Register updates depend on rising clock edge and asserted load signal
   -- add conditions and connections for any added PORT IDs
   -------------------------------------------------------------------------------
   outputs: process(CLK, RESET)
   begin
      if(RESET = '1') then
        s_sseg_val <= x"00";
      end if;
      if (rising_edge(CLK)) then

         if( s_port_id = VGA_WRITE_ID and s_load = '1') then
                   r_vga_we <= '1';
                else
                   r_vga_we <= '0';
                end if;

         if (s_load = '1') then
          
             --the register definition for the LEDS
            if (s_port_id = LEDS_ID) then
               r_LEDS <= s_output_port;
            elsif(s_port_id = SSEG_CNTR_ID) then
                s_sseg_CNTR <= s_output_port;
            

            elsif(s_port_id = SSEG_VAL_ID) then
                s_sseg_VAL <= s_output_port;
                     elsif (s_port_id = VGA_HADDR_ID) then
                   r_vga_wa(10 downto 6) <= s_output_port(4 downto 0);
                elsif (s_port_id = VGA_LADDR_ID) then
                   r_vga_wa(5 downto 0) <= s_output_port(5 downto 0);
                elsif (s_port_id = VGA_WRITE_ID) then
                   r_vga_wd <= s_output_port;
                end if;  
                
                
                           end if;
             end if;
          
        
        end process outputs;
   -------------------------------------------------------------------------------

   -- Register Interface Assignments ---------------------------------------------
   -- add all outputs that you added to this design
--   LEDS <= r_LEDS;

 end Behavioral;