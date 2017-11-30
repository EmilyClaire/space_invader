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
   attribute INIT_01 of ram_1024_x_18 : label is "454144396600671D682770007A0063036B016A4A7E0B7F02700042606281A000";  
   attribute INIT_02 of ram_1024_x_18 : label is "8451821989718551850181D180F307FFC701682788B14541443980F3C80188B1";  
   attribute INIT_03 of ram_1024_x_18 : label is "9D01890149EB63037D106914818086C9CA0183E181C083796A4A81B30A0089D1";  
   attribute INIT_04 of ram_1024_x_18 : label is "641D791083298002823BC301990188B145CA630366FF641D7910800281EBC301";  
   attribute INIT_05 of ram_1024_x_18 : label is "990188B1454949CB296049CA831A0900831882D3092582C30C0149CA630366FF";  
   attribute INIT_06 of ram_1024_x_18 : label is "84A98002834BC301990188B145CA63036600641D791080028219832082D3C301";  
   attribute INIT_07 of ram_1024_x_18 : label is "84A97F02844BDF01800284516BFF83D06B0183CA0B01A90A88EA091D8901890A";  
   attribute INIT_08 of ram_1024_x_18 : label is "45CA44C2630366E3790C780A800284518413C301990149CB295849CA6303790C";  
   attribute INIT_09 of ram_1024_x_18 : label is "800284CBC301990188B145CA44C263036600790C780A80028473C301990188B1";  
   attribute INIT_0A of ram_1024_x_18 : label is "980140C3858A184A782060FF80028523C3018001980140C36303A00A780C6000";  
   attribute INIT_0B of ram_1024_x_18 : label is "800249CB49C369FF85F88679466949C3890185E2091D49C286A1860180028560";  
   attribute INIT_0C of ram_1024_x_18 : label is "46698002863BC301870188EA49B056CA493A867349B056C249416303681D6710";  
   attribute INIT_0D of ram_1024_x_18 : label is "990285916F00980158C96D037920800288B145CA44C26600800288B145CA44C2";  
   attribute INIT_0E of ram_1024_x_18 : label is "8901690C86A1980158C939D07920800287497E0B8743DE0186F30F0A8F029802";  
   attribute INIT_0F of ram_1024_x_18 : label is "980158C93980794080027A0087DB1A0A9A0286796D0347C38701870A48CB484A";  
   attribute INIT_10 of ram_1024_x_18 : label is "89D188B166E04541641D900286796DFC47C3C701671D48CB484A8901691086A1";  
   attribute INIT_11 of ram_1024_x_18 : label is "671D6827897188E08002469244904591041F053F8002700088AB100A88B166FF";  
   attribute INIT_12 of ram_1024_x_18 : label is "D101712F88E0891307FFC70188B1454144398913C80188B14541443966E08801";  
   attribute INIT_13 of ram_1024_x_18 : label is "D301731FD201721FD101711F8002897B3100898B3200899BD301732FD201722F";  
   attribute INIT_14 of ram_1024_x_18 : label is "8ADA1401AAC81401AAF014018A8A140054803420800289DB110089EB320089FB";  
   attribute INIT_15 of ram_1024_x_18 : label is "82696C018B0882696CFF8B0887E18B0888B166FF897188B1660345E144D98B08";  
   attribute INIT_16 of ram_1024_x_18 : label is "00000000000000000000000000000000000000000000000000000000A0038B08";  
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
   attribute INIT_3F of ram_1024_x_18 : label is "8A30000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_00 of ram_1024_x_18 : label is "324CCF3B1283FD0280030CCFF1283FD2A3F080CC0003B0080FFFFFFD00000000";  
   attribute INITP_01 of ram_1024_x_18 : label is "83738CB0B20D323A8E3D03401280003F43008C0483F4A8FF4A03FD280FF4280F";  
   attribute INITP_02 of ram_1024_x_18 : label is "000000000000000430C030C01113F4C8BBB488BBB0E0080EF07FA7330CE32C2C";  
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
          INIT_01 => X"454144396600671D682770007A0063036B016A4A7E0B7F02700042606281A000",  
          INIT_02 => X"8451821989718551850181D180F307FFC701682788B14541443980F3C80188B1",  
          INIT_03 => X"9D01890149EB63037D106914818086C9CA0183E181C083796A4A81B30A0089D1",  
          INIT_04 => X"641D791083298002823BC301990188B145CA630366FF641D7910800281EBC301",  
          INIT_05 => X"990188B1454949CB296049CA831A0900831882D3092582C30C0149CA630366FF",  
          INIT_06 => X"84A98002834BC301990188B145CA63036600641D791080028219832082D3C301",  
          INIT_07 => X"84A97F02844BDF01800284516BFF83D06B0183CA0B01A90A88EA091D8901890A",  
          INIT_08 => X"45CA44C2630366E3790C780A800284518413C301990149CB295849CA6303790C",  
          INIT_09 => X"800284CBC301990188B145CA44C263036600790C780A80028473C301990188B1",  
          INIT_0A => X"980140C3858A184A782060FF80028523C3018001980140C36303A00A780C6000",  
          INIT_0B => X"800249CB49C369FF85F88679466949C3890185E2091D49C286A1860180028560",  
          INIT_0C => X"46698002863BC301870188EA49B056CA493A867349B056C249416303681D6710",  
          INIT_0D => X"990285916F00980158C96D037920800288B145CA44C26600800288B145CA44C2",  
          INIT_0E => X"8901690C86A1980158C939D07920800287497E0B8743DE0186F30F0A8F029802",  
          INIT_0F => X"980158C93980794080027A0087DB1A0A9A0286796D0347C38701870A48CB484A",  
          INIT_10 => X"89D188B166E04541641D900286796DFC47C3C701671D48CB484A8901691086A1",  
          INIT_11 => X"671D6827897188E08002469244904591041F053F8002700088AB100A88B166FF",  
          INIT_12 => X"D101712F88E0891307FFC70188B1454144398913C80188B14541443966E08801",  
          INIT_13 => X"D301731FD201721FD101711F8002897B3100898B3200899BD301732FD201722F",  
          INIT_14 => X"8ADA1401AAC81401AAF014018A8A140054803420800289DB110089EB320089FB",  
          INIT_15 => X"82696C018B0882696CFF8B0887E18B0888B166FF897188B1660345E144D98B08",  
          INIT_16 => X"00000000000000000000000000000000000000000000000000000000A0038B08",  
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
          INIT_3F => X"8A30000000000000000000000000000000000000000000000000000000000000",  
          INITP_00 => X"324CCF3B1283FD0280030CCFF1283FD2A3F080CC0003B0080FFFFFFD00000000",  
          INITP_01 => X"83738CB0B20D323A8E3D03401280003F43008C0483F4A8FF4A03FD280FF4280F",  
          INITP_02 => X"000000000000000430C030C01113F4C8BBB488BBB0E0080EF07FA7330CE32C2C",  
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
