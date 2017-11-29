-----------------------------------------------------------------------------
-- Definition of a single port ROM for RATASM defined by prog_rom.psm 
--  
-- Generated by RATASM Assembler 
--  
-- Standard IEEE libraries  
--  
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library unisim;
use unisim.vcomponents.all;
-----------------------------------------------------------------------------


entity prog_rom is 
   port (     ADDRESS : in std_logic_vector(9 downto 0); 
          INSTRUCTION : out std_logic_vector(17 downto 0); 
                  CLK : in std_logic);  
end prog_rom;



architecture low_level_definition of prog_rom is

   -----------------------------------------------------------------------------
   -- Attributes to define ROM contents during implementation synthesis. 
   -- The information is repeated in the generic map for functional simulation. 
   -----------------------------------------------------------------------------

   attribute INIT_00 : string; 
   attribute INIT_01 : string; 
   attribute INIT_02 : string; 
   attribute INIT_03 : string; 
   attribute INIT_04 : string; 
   attribute INIT_05 : string; 
   attribute INIT_06 : string; 
   attribute INIT_07 : string; 
   attribute INIT_08 : string; 
   attribute INIT_09 : string; 
   attribute INIT_0A : string; 
   attribute INIT_0B : string; 
   attribute INIT_0C : string; 
   attribute INIT_0D : string; 
   attribute INIT_0E : string; 
   attribute INIT_0F : string; 
   attribute INIT_10 : string; 
   attribute INIT_11 : string; 
   attribute INIT_12 : string; 
   attribute INIT_13 : string; 
   attribute INIT_14 : string; 
   attribute INIT_15 : string; 
   attribute INIT_16 : string; 
   attribute INIT_17 : string; 
   attribute INIT_18 : string; 
   attribute INIT_19 : string; 
   attribute INIT_1A : string; 
   attribute INIT_1B : string; 
   attribute INIT_1C : string; 
   attribute INIT_1D : string; 
   attribute INIT_1E : string; 
   attribute INIT_1F : string; 
   attribute INIT_20 : string; 
   attribute INIT_21 : string; 
   attribute INIT_22 : string; 
   attribute INIT_23 : string; 
   attribute INIT_24 : string; 
   attribute INIT_25 : string; 
   attribute INIT_26 : string; 
   attribute INIT_27 : string; 
   attribute INIT_28 : string; 
   attribute INIT_29 : string; 
   attribute INIT_2A : string; 
   attribute INIT_2B : string; 
   attribute INIT_2C : string; 
   attribute INIT_2D : string; 
   attribute INIT_2E : string; 
   attribute INIT_2F : string; 
   attribute INIT_30 : string; 
   attribute INIT_31 : string; 
   attribute INIT_32 : string; 
   attribute INIT_33 : string; 
   attribute INIT_34 : string; 
   attribute INIT_35 : string; 
   attribute INIT_36 : string; 
   attribute INIT_37 : string; 
   attribute INIT_38 : string; 
   attribute INIT_39 : string; 
   attribute INIT_3A : string; 
   attribute INIT_3B : string; 
   attribute INIT_3C : string; 
   attribute INIT_3D : string; 
   attribute INIT_3E : string; 
   attribute INIT_3F : string; 
   attribute INITP_00 : string; 
   attribute INITP_01 : string; 
   attribute INITP_02 : string; 
   attribute INITP_03 : string; 
   attribute INITP_04 : string; 
   attribute INITP_05 : string; 
   attribute INITP_06 : string; 
   attribute INITP_07 : string; 


   ----------------------------------------------------------------------
   -- Attributes to define ROM contents during implementation synthesis.
   ----------------------------------------------------------------------

   attribute INIT_00 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_01 of ram_1024_x_18 : label is "87D9454144396600671D68277A0063036B016A4A7E0B7F02700042606281A000";  
   attribute INIT_02 of ram_1024_x_18 : label is "88F9844982118899854984F981C980EB07FFC701682787D94541443980EBC801";  
   attribute INIT_03 of ram_1024_x_18 : label is "C3019D01890149EB63037D106914817886C1CA0183D981B883716A4A81AB0A00";  
   attribute INIT_04 of ram_1024_x_18 : label is "66FF641D7910832180028233C301990187D945CA630366FF641D7910800281E3";  
   attribute INIT_05 of ram_1024_x_18 : label is "C301990187D9454949CB296049CA83120900831082CB092582BB0C0149CA6303";  
   attribute INIT_06 of ram_1024_x_18 : label is "890A84A180028343C301990187D945CA63036600641D791080028211831882CB";  
   attribute INIT_07 of ram_1024_x_18 : label is "790C84A17F028443DF01800284496BFF83C86B0183C20B01A90A8812091D8901";  
   attribute INIT_08 of ram_1024_x_18 : label is "87D945CA44C2630366E3790C780A80028449840BC301990149CB295849CA6303";  
   attribute INIT_09 of ram_1024_x_18 : label is "6000800284C3C301990187D945CA44C263036600790C780A8002846BC3019901";  
   attribute INIT_0A of ram_1024_x_18 : label is "8558980140C38582184A782060FF8002851BC3018001980140C36303A00A780C";  
   attribute INIT_0B of ram_1024_x_18 : label is "6710800249CB49C369FF85F08671466949C3890185DA091D49C2869985F98002";  
   attribute INIT_0C of ram_1024_x_18 : label is "44C2466980028633C3018701881249B056CA493A866B49B056C249416303681D";  
   attribute INIT_0D of ram_1024_x_18 : label is "9802990285896F00980158C96D037920800287D945CA44C26600800287D945CA";  
   attribute INIT_0E of ram_1024_x_18 : label is "484A8901690C8699980158C939D07920800287417E0B873BDE0186EB0F0A8F02";  
   attribute INIT_0F of ram_1024_x_18 : label is "469244904591041F053F80027A0087D31A0A9A0286716D0347C38701870A48CB";  
   attribute INIT_10 of ram_1024_x_18 : label is "C70187D945414439883BC80187D94541443966E08801671D6827889988088002";  
   attribute INIT_11 of ram_1024_x_18 : label is "711F800288A3310088B3320088C3D301732FD201722FD101712F8808883B07FF";  
   attribute INIT_12 of ram_1024_x_18 : label is "140189B2140054803420800289031100891332008923D301731FD201721FD101";  
   attribute INIT_13 of ram_1024_x_18 : label is "8A6A10018B3887D966FF889987D9660345E144D98B388B0A1401A9F01401AB20";  
   attribute INIT_14 of ram_1024_x_18 : label is "6600457144798AC8900187D966FC456144694CE1CD014DD987D9660045614469";  
   attribute INIT_15 of ram_1024_x_18 : label is "87D966FF88F987D966E045E144D9D00187D966FC457144794EE1CF014FD987D9";  
   attribute INIT_16 of ram_1024_x_18 : label is "00000000000000000000000000000000A0038B3882616C018B3882616CFF8B38";  
   attribute INIT_17 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_18 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_19 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1A of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1B of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1C of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1D of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1E of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1F of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_20 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_21 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_22 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_23 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_24 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_25 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_26 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_27 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_28 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_29 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2A of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2B of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2C of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2D of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2E of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2F of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_30 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_31 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_32 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_33 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_34 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_35 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_36 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_37 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_38 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_39 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3A of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3B of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3C of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3D of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3E of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3F of ram_1024_x_18 : label is "8958000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_00 of ram_1024_x_18 : label is "CC9333CEC4A0FF40A000C333FC4A0FF4A8FC20330000EC0203FFFFFD00000000";  
   attribute INITP_01 of ram_1024_x_18 : label is "FE9CE32C2C834C8EA38F40D004A0000FD0C0230120FD2A3FD280FF4A03FD0A03";  
   attribute INITP_02 of ram_1024_x_18 : label is "000000000000430C30C23020C08C083030C300444FD322EED222EEC380203BC1";  
   attribute INITP_03 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_04 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_05 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_06 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_07 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  


begin

   ----------------------------------------------------------------------
   --Instantiate the Xilinx primitive for a block RAM 
   --INIT values repeated to define contents for functional simulation 
   ----------------------------------------------------------------------
   ram_1024_x_18: RAMB16_S18 
   --synthesitranslate_off
   --INIT values repeated to define contents for functional simulation
   generic map ( 
          INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_01 => X"87D9454144396600671D68277A0063036B016A4A7E0B7F02700042606281A000",  
          INIT_02 => X"88F9844982118899854984F981C980EB07FFC701682787D94541443980EBC801",  
          INIT_03 => X"C3019D01890149EB63037D106914817886C1CA0183D981B883716A4A81AB0A00",  
          INIT_04 => X"66FF641D7910832180028233C301990187D945CA630366FF641D7910800281E3",  
          INIT_05 => X"C301990187D9454949CB296049CA83120900831082CB092582BB0C0149CA6303",  
          INIT_06 => X"890A84A180028343C301990187D945CA63036600641D791080028211831882CB",  
          INIT_07 => X"790C84A17F028443DF01800284496BFF83C86B0183C20B01A90A8812091D8901",  
          INIT_08 => X"87D945CA44C2630366E3790C780A80028449840BC301990149CB295849CA6303",  
          INIT_09 => X"6000800284C3C301990187D945CA44C263036600790C780A8002846BC3019901",  
          INIT_0A => X"8558980140C38582184A782060FF8002851BC3018001980140C36303A00A780C",  
          INIT_0B => X"6710800249CB49C369FF85F08671466949C3890185DA091D49C2869985F98002",  
          INIT_0C => X"44C2466980028633C3018701881249B056CA493A866B49B056C249416303681D",  
          INIT_0D => X"9802990285896F00980158C96D037920800287D945CA44C26600800287D945CA",  
          INIT_0E => X"484A8901690C8699980158C939D07920800287417E0B873BDE0186EB0F0A8F02",  
          INIT_0F => X"469244904591041F053F80027A0087D31A0A9A0286716D0347C38701870A48CB",  
          INIT_10 => X"C70187D945414439883BC80187D94541443966E08801671D6827889988088002",  
          INIT_11 => X"711F800288A3310088B3320088C3D301732FD201722FD101712F8808883B07FF",  
          INIT_12 => X"140189B2140054803420800289031100891332008923D301731FD201721FD101",  
          INIT_13 => X"8A6A10018B3887D966FF889987D9660345E144D98B388B0A1401A9F01401AB20",  
          INIT_14 => X"6600457144798AC8900187D966FC456144694CE1CD014DD987D9660045614469",  
          INIT_15 => X"87D966FF88F987D966E045E144D9D00187D966FC457144794EE1CF014FD987D9",  
          INIT_16 => X"00000000000000000000000000000000A0038B3882616C018B3882616CFF8B38",  
          INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3F => X"8958000000000000000000000000000000000000000000000000000000000000",  
          INITP_00 => X"CC9333CEC4A0FF40A000C333FC4A0FF4A8FC20330000EC0203FFFFFD00000000",  
          INITP_01 => X"FE9CE32C2C834C8EA38F40D004A0000FD0C0230120FD2A3FD280FF4A03FD0A03",  
          INITP_02 => X"000000000000430C30C23020C08C083030C300444FD322EED222EEC380203BC1",  
          INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")  


   --synthesis translate_on
   port map(  DI => "0000000000000000",
             DIP => "00",
              EN => '1',
              WE => '0',
             SSR => '0',
             CLK => clk,
            ADDR => address,
              DO => INSTRUCTION(15 downto 0),
             DOP => INSTRUCTION(17 downto 16)); 

--
end low_level_definition;
--
----------------------------------------------------------------------
-- END OF FILE prog_rom.vhd
----------------------------------------------------------------------
