
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Binary_To_BCD is

generic(
	Idle : integer : 0;
	Init : integer : 1;
	Shift : integer : 3;
	Check : integer : 2;
	Done : integer : 6;
);

port(
			CLK : in std_logic;
			RST : in std_logic;
			START : in std_logic;
			BIN   : in std_logic_vector (9 downto 0);
			BCDOUT: out std_logic_vector (15 downto 0);
	);
end Binary_To_BCD;

architecture Behavioral of Binary_To_BCD is


	signal BCDOUT : std_logic_vector (15 downto 0) := x"0000";		-- Output BCD values, contains 4 digits
			
	signal shiftCount : std_logic_vector (4 downto 0) := "00000";	-- Stores number of shifts executed
	signal tmpSR : std_logic_vector (27 downto 0);						-- Temporary shift regsiter

	signal STATE : std_logic_vector (2 downto 0) := Idle;				-- Present state
			






			always @(posedge CLK) begin
					if(RST == 1'b1) begin
							-- Reset/clear values
							BCDOUT <= 16'h0000;
							tmpSR <= 28'h0000000;
							STATE <= Idle;
					end
					else begin

							case (STATE)
							
									-- Idle State
									Idle : begin
											BCDOUT <= BCDOUT;								 	-- Output does not change
											tmpSR <= 28'h0000000;							-- Temp shift reg empty
											
											if(START == 1'b1) begin
													STATE <= Init;
											end
											else begin
													STATE <= Idle;
											end
									end

									-- Init State
									Init : begin
											BCDOUT <= BCDOUT;									-- Output does not change
											tmpSR <= {18'b000000000000000000, BIN};	-- Copy input to lower 10 bits

											STATE <= Shift;
									end

									-- Shift State
									Shift : begin
											BCDOUT <= BCDOUT;							-- Output does not change
											tmpSR <= {tmpSR[26:0], 1'b0};			-- Shift left 1 bit

											shiftCount <= shiftCount + 1'b1;		-- Count the shift
											
											STATE <= Check;							-- Check digits

									end

									-- Check State
									Check : begin
											BCDOUT <= BCDOUT;							-- Output does not change

											-- Not done converting
											if(shiftCount != 5'd12) begin

													-- Add 3 to thousands place
													if(tmpSR[27:24] >= 3'd5) begin
															tmpSR[27:24] <= tmpSR[27:24] + 2'd3;
													end

													-- Add 3 to hundreds place
													if(tmpSR[23:20] >= 3'd5) begin
															tmpSR[23:20] <= tmpSR[23:20] + 2'd3;
													end
													
													-- Add 3 to tens place
													if(tmpSR[19:16] >= 3'd5) begin
															tmpSR[19:16] <= tmpSR[19:16] + 2'd3;
													end
													
													-- Add 3 to ones place
													if(tmpSR[15:12] >= 3'd5) begin
															tmpSR[15:12] <= tmpSR[15:12] + 2'd3;
													end

													STATE <= Shift;	-- Shift again

											end
											-- Done converting
											else begin
													STATE <= Done;
											end
											
									end
									
									-- Done State
									Done : begin
									
											BCDOUT <= tmpSR[27:12];	-- Assign output the new BCD values
											tmpSR <= 28'h0000000;	-- Clear temp shift register
											shiftCount <= 5'b00000; -- Clear shift count

											STATE <= Idle;

									end
							endcase
					end
			end

endmodule

end Behavioral;
