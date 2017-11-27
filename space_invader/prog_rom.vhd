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
   attribute INIT_01 of ram_1024_x_18 : label is "C8018511454144396600671D682783996F006E006D006C00700042606281A000";  
   attribute INIT_02 of ram_1024_x_18 : label is "6B016A2468016700851145E144D966FF7C14DB017B03854980E307FFC70180E3";  
   attribute INIT_03 of ram_1024_x_18 : label is "860A5D403D58860A5D405D61821B4D388549818BC301285884A1454144396303";  
   attribute INIT_04 of ram_1024_x_18 : label is "828B5B3886725D403D5886725D403D5886725D405D7182734F38860A5D403D58";  
   attribute INIT_05 of ram_1024_x_18 : label is "6C008300851166FC4469CD0182FA0D00851166004561446984A14541443986D8";  
   attribute INIT_06 of ram_1024_x_18 : label is "0A00CA0185496E008368851166FC44794571CF0183620F008511660045714479";  
   attribute INIT_07 of ram_1024_x_18 : label is "84416B01841A0B018542071D6A2487018002839B08FFC801874181C0285883C2";  
   attribute INIT_08 of ram_1024_x_18 : label is "C301285885114439454166006303C70181886303682784416BFF818863036801";  
   attribute INIT_09 of ram_1024_x_18 : label is "66E3443945418511850384E0C50384DA0BFF66004439454180028701845B0303";  
   attribute INIT_0A of ram_1024_x_18 : label is "8573D301732FD201722FD101712F85408002469244904591041F053F80028511";  
   attribute INIT_0B of ram_1024_x_18 : label is "85B3110085C3320085D3D301731FD201721FD101711F80028553310085633200";  
   attribute INIT_0C of ram_1024_x_18 : label is "682785498540862B07FFC701862BC801851145414439661C671D682785498002";  
   attribute INIT_0D of ram_1024_x_18 : label is "443966E0671D682785498540869307FFC7018693C80185114541443966FC671D";  
   attribute INIT_0E of ram_1024_x_18 : label is "14005480342080028511660045E144D9854086FB07FFC70186FBC80185114541";  
   attribute INIT_0F of ram_1024_x_18 : label is "66FF85498511660345E144D989F889B21401896A1402885214058812140387D2";  
   attribute INIT_10 of ram_1024_x_18 : label is "851166004561446988CA100189F8851166FF85498511661C45E144D989F88511";  
   attribute INIT_11 of ram_1024_x_18 : label is "4EE1CF014FD9851166004571447989289001851166FC456144694CE1CD014DD9";  
   attribute INIT_12 of ram_1024_x_18 : label is "874189FA1C0189F8851166FF85A9851166E045E144D9D001851166FC45714479";  
   attribute INIT_13 of ram_1024_x_18 : label is "A00389F8851166FF45E144D99C01874189FA1C2789F8851166FF45E144D9DC01";  
   attribute INIT_14 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_15 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_16 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
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
   attribute INIT_3F of ram_1024_x_18 : label is "8768000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_00 of ram_1024_x_18 : label is "333E4E00E30C2330C32330000000000000000803FF03EC3880FCFFFD00000000";  
   attribute INITP_01 of ram_1024_x_18 : label is "C300CCCCFD300E203F03880FC0E203F1322EED222EEC7FA4C088F063803E3CCF";  
   attribute INITP_02 of ram_1024_x_18 : label is "00000000000000000000000000000000430830C20C30C23020C08C083030C300";  
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
          INIT_01 => X"C8018511454144396600671D682783996F006E006D006C00700042606281A000",  
          INIT_02 => X"6B016A2468016700851145E144D966FF7C14DB017B03854980E307FFC70180E3",  
          INIT_03 => X"860A5D403D58860A5D405D61821B4D388549818BC301285884A1454144396303",  
          INIT_04 => X"828B5B3886725D403D5886725D403D5886725D405D7182734F38860A5D403D58",  
          INIT_05 => X"6C008300851166FC4469CD0182FA0D00851166004561446984A14541443986D8",  
          INIT_06 => X"0A00CA0185496E008368851166FC44794571CF0183620F008511660045714479",  
          INIT_07 => X"84416B01841A0B018542071D6A2487018002839B08FFC801874181C0285883C2",  
          INIT_08 => X"C301285885114439454166006303C70181886303682784416BFF818863036801",  
          INIT_09 => X"66E3443945418511850384E0C50384DA0BFF66004439454180028701845B0303",  
          INIT_0A => X"8573D301732FD201722FD101712F85408002469244904591041F053F80028511",  
          INIT_0B => X"85B3110085C3320085D3D301731FD201721FD101711F80028553310085633200",  
          INIT_0C => X"682785498540862B07FFC701862BC801851145414439661C671D682785498002",  
          INIT_0D => X"443966E0671D682785498540869307FFC7018693C80185114541443966FC671D",  
          INIT_0E => X"14005480342080028511660045E144D9854086FB07FFC70186FBC80185114541",  
          INIT_0F => X"66FF85498511660345E144D989F889B21401896A1402885214058812140387D2",  
          INIT_10 => X"851166004561446988CA100189F8851166FF85498511661C45E144D989F88511",  
          INIT_11 => X"4EE1CF014FD9851166004571447989289001851166FC456144694CE1CD014DD9",  
          INIT_12 => X"874189FA1C0189F8851166FF85A9851166E045E144D9D001851166FC45714479",  
          INIT_13 => X"A00389F8851166FF45E144D99C01874189FA1C2789F8851166FF45E144D9DC01",  
          INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",  
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
          INIT_3F => X"8768000000000000000000000000000000000000000000000000000000000000",  
          INITP_00 => X"333E4E00E30C2330C32330000000000000000803FF03EC3880FCFFFD00000000",  
          INITP_01 => X"C300CCCCFD300E203F03880FC0E203F1322EED222EEC7FA4C088F063803E3CCF",  
          INITP_02 => X"00000000000000000000000000000000430830C20C30C23020C08C083030C300",  
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
