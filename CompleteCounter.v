//1ll1l11l11l11ll1l11111l111111l1ll111 ECE2072 Assignment 1ll1l11l11l11ll1l11111l111111l1ll111
//
//     To be completed by Avvienash Jaganathan 32281013
//     Your count sequence is: 326880544745018 Note that the sequence wraps around at both ends.
//     Do not share or show this file with anyone. Do not include any code from others' files in this file.
//     For marking and Turnitin exclusions, leave all comments in this file unaltered.
//
//1ll1l11l11l11ll1l11111l111111l1ll111 ECE2072 Assignment 1ll1l11l11l11ll1l11111l111111l1ll111
 
 
//1ll1l11l11l11ll1l11111l111111l1ll111 Module CounterSkipReverse 1ll1l11l11l11ll1l11111l111111l1ll111
//
//   Sequential module to produce oState changes on each Clk posedge using the above count sequence.
//
//1ll1l11l11l11ll1l11111l111111l1ll111 Module CounterSkipReverse 1ll1l11l11l11ll1l11111l111111l1ll111

`timescale 1 ns / 1 ps 

module CounterSkipReverse(iClk, iRst, iSkip, iRev, oState);
    input iClk, iRst, iSkip, iRev;
   //declare oState:
	output reg[3:0] oState;
	
	// Generate next States
//	
	always @(posedge iClk) begin
		if(iRst) begin 
			oState <= 4'd0;
			end
		else if(iSkip & iRev) begin 
			if (oState > 4'd5) oState <=  oState - 4'd6;
			else begin oState <= oState + 4'd9; end
			end
		else if(iSkip) begin 
			if (oState > 4'd9) oState <=  oState - 4'd10;
			else begin oState <= oState + 4'd5; end
			end
		else if(iRev) begin
			if (oState < 4'd2) oState <=  oState + 4'd13;
			else begin oState <= oState - 4'd2; end
			end
		else begin 
			if (oState == 4'd14) oState <= 4'd0;
			else begin oState <= oState + 4'd1; end
		end

	end

// wire [1:0] w;
//	assign w[1]=iSkip;
//	assign w[0]=iRev;
//	
//	// Define the states A to O
//	// Ouput Method: parameter  A = 4'b1000, B = 4'b1001, C = 4'b1101, D = 4'b0011, E = 4'b1010, F = 4'b0001, G = 4'b0100, H = 4'b0111,  I = 4'b1110, J = 4'b1100, K = 4'b1111, L = 4'b0110, M = 4'b0010, N = 4'b0000, O = 4'b1011;
//	
//	//Gray Code Method: parameter  A = 4'b0000, B = 4'b0001, C = 4'b0011, D = 4'b0010, E = 4'b0110, F = 4'b0100, G = 4'b0101, H = 4'b0111,  I = 4'b1111, J = 4'b1101, K = 4'b1100, L = 4'b1110, M = 4'b1010, N = 4'b1011, O = 4'b1001;
//	
//	// Sequencing Method
//	//parameter  A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111,  I = 4'b1000, J = 4'b1001, K = 4'b1010, L = 4'b1011, M = 4'b1100, N = 4'b1101, O = 4'b1110;
//	
//	// Sequencing Method 2 // best so far
//	parameter  A = 4'b0001, B = 4'b0010, C = 4'b0011, D = 4'b0100, E = 4'b0101, F = 4'b0110, G = 4'b0111,  H = 4'b1000, I = 4'b1001, J = 4'b1010, K = 4'b1011, L = 4'b1100, M = 4'b1101, N = 4'b1110, O = 4'b1111;
//	
//	// Sequencing Method 3
//	//parameter  A = 4'b0000, B = 4'b0010, C = 4'b0011, D = 4'b0100, E = 4'b0101, F = 4'b0110, G = 4'b0111,  H = 4'b1000, I = 4'b1001, J = 4'b1010, K = 4'b1011, L = 4'b1100, M = 4'b1101, N = 4'b1110, O = 4'b1111;
//	
//	// Decreasing up to 1
//	//parameter  A = 4'b1111, B = 4'b1110, C = 4'b1101, D = 4'b1100, E = 4'b1011, F = 4'b1010, G = 4'b1001, H = 4'b1000,  I = 4'b0111, J = 4'b0110, K = 4'b0101, L = 4'b0100, M = 4'b0011, N = 4'b0010, O = 4'b0001;
//	
//	// Decreasing up to zero
//	//parameter  A = 4'b1110, B = 4'b1101, C = 4'b1100, D = 4'b1011, E = 4'b1010, F = 4'b1001, G = 4'b1000,  H = 4'b0111, I = 4'b0110, J = 4'b0101, K = 4'b0100, L = 4'b0011, M = 4'b0010, N = 4'b0001, O = 4'b0000;
//	
//	// generate the next state logic
//	always @(posedge iClk)
//	begin	
//		if (iRst) oState = A;
//		else begin
//    		case (oState)
//    			A: case(w)
//    		      4'b11: oState = J;
//    				4'b10: oState = F;
//    				4'b01: oState = N;
//    				4'b00: oState = B;
//    				endcase
//    			B: case(w)
//    				4'b11: oState = K;
//    				4'b10: oState = G;
//    				4'b01: oState = O;
//    				4'b00: oState = C;
//    				endcase
//    			C: case(w)
//    				4'b11: oState = L;
//    				4'b10: oState = H;
//    				4'b01: oState = A;
//    				4'b00: oState = D;
//    				endcase
//    			D: case(w)
//    				4'b11: oState = M;
//    				4'b10: oState = I;
//    				4'b01: oState = B;
//    				4'b00: oState = E;
//    				endcase
//    			E: case(w)
//    				4'b11: oState = N;
//    				4'b10: oState = J;
//    				4'b01: oState = C;
//    				4'b00: oState = F;
//    				endcase
//    			F: case(w)
//    				4'b11: oState = O;
//    				4'b10: oState = K;
//    				4'b01: oState = D;
//    				4'b00: oState = G;
//    				endcase
//    			G: case(w)
//    				4'b11: oState = A;
//    				4'b10: oState = L;
//    				4'b01: oState = E;
//    				4'b00: oState = H;
//    				endcase
//    			H: case(w)
//    				4'b11: oState = B;
//    				4'b10: oState = M;
//    				4'b01: oState = F;
//    				4'b00: oState = I;
//    				endcase
//    			I: case(w)
//    				4'b11: oState = C;
//    				4'b10: oState = N;
//    				4'b01: oState = G;
//    				4'b00: oState = J;
//    				endcase
//    			J: case(w)
//    				4'b11: oState = D;
//    				4'b10: oState = O;
//    				4'b01: oState = H;
//    				4'b00: oState = K;
//    				endcase
//    			K: case(w)
//    				4'b11: oState = E;
//    				4'b10: oState = A;
//    				4'b01: oState = I;
//    				4'b00: oState = L;
//    				endcase
//    			L: case(w)
//    				4'b11: oState = F;
//    				4'b10: oState = B;
//    				4'b01: oState = J;
//    				4'b00: oState = M;
//    				endcase
//    			M: case(w)
//    				4'b11: oState = G;
//    				4'b10: oState = C;
//    				4'b01: oState = K;
//    				4'b00: oState = N;
//    				endcase
//    			N: case(w)
//    				4'b11: oState = H;
//    				4'b10: oState = D;
//    				4'b01: oState = L;
//    				4'b00: oState = O;
//    				endcase
//    			O: case(w)
//    				4'b11: oState = I;
//    				4'b10: oState = E;
//    				4'b01: oState = M;
//    				4'b00: oState = A;
//    				endcase
//    			default: oState = 4'bxxxx;
//    		endcase
//    	end	
//	end
endmodule //1ll1l11l11l11ll1l11111l111111l1ll111 CounterSkipReverse 1ll1l11l11l11ll1l11111l111111l1ll111 
 
 
 
//1ll1l11l11l11ll1l11111l111111l1ll111 Module StateToCountSequence 1ll1l11l11l11ll1l11111l111111l1ll111
//
//    Combinational module to map iState to a 4 bit BCD output
//
//1ll1l11l11l11ll1l11111l111111l1ll111 Module StateToCountSequence 1ll1l11l11l11ll1l11111l111111l1ll111
 
module StateToCountSequence(iState, oV);
	//declare the input and output 
	input [3:0] iState;
	output [3:0] oV; 
  
	//declare any internal wire and reg types here
	wire a,b,c,d;
	// define the wires a to d
	assign a = iState[3];
	assign b = iState[2];
	assign c = iState[1];
	assign d = iState[0];
	
	// Gray Code Method
	//(a & ~b &~c) | (~a & c & ~d);
	//(a & b) | (b & d) | (~a & c & d);
	//(a & b & ~c & d) | (~a & ~b & ~c) | (~a & ~b & d);
	//(~b & ~c & ~d) | (b & ~c & d) | (a & b & c & ~d) | (a & ~b & c & d);
	
	assign oV[3] = (~a & b & ~c & ~d) | (~a & ~b & c & d) | (a & b & c);
	assign oV[2] = (a & ~b) | (b & c & d) | (~a & c & ~d);
	assign oV[1] = (~a & ~b & ~d ) | (~b & ~c & d);
	assign oV[0] = (~a & ~b & ~c & ~d) | (~a & b & c & ~d) | (a & d);
  
	//Have you checked for inferred latches in this module?
endmodule //1ll1l11l11l11ll1l11111l111111l1ll111 StateToCountSequence 1ll1l11l11l11ll1l11111l111111l1ll111 
 
 
 
//1ll1l11l11l11ll1l11111l111111l1ll111 Module CompleteCounter 1ll1l11l11l11ll1l11111l111111l1ll111
//
//   Instantiates previous modules for complete design
//
//1ll1l11l11l11ll1l11111l111111l1ll111 Module CompleteCounter 1ll1l11l11l11ll1l11111l111111l1ll111
 
module CompleteCounter(iClk, iRst, iSkip, iRev, oV, oState);
	input iClk, iRst, iSkip, iRev;
	output [3:0] oV;
	output [3:0] oState;
	//declare oState next line
 
	// call the modules 
	CounterSkipReverse cntr(.iClk(iClk), .iRst(iRst), .iSkip(iSkip), .iRev(iRev), .oState(oState));
	StateToCountSequence statemap(.iState(oState), .oV(oV));
endmodule //1ll1l11l11l11ll1l11111l111111l1ll111 CompleteCounter 1ll1l11l11l11ll1l11111l111111l1ll111

module AltCompleteCounter(iClk, iRst, iSkip, iRev, oV, oState);
	input iClk, iRst, iSkip, iRev;
	output reg [3:0] oV;
	output reg[3:0] oState;
	
	wire [1:0] w;
	assign w[1]=iSkip;
	assign w[0]=iRev;
	
	// Define the states A to O
	// Ouput Method: parameter  A = 4'b1000, B = 4'b1001, C = 4'b1101, D = 4'b0011, E = 4'b1010, F = 4'b0001, G = 4'b0100, H = 4'b0111,  I = 4'b1110, J = 4'b1100, K = 4'b1111, L = 4'b0110, M = 4'b0010, N = 4'b0000, O = 4'b1011;
	
	//Gray Code Method: parameter  A = 4'b0000, B = 4'b0001, C = 4'b0011, D = 4'b0010, E = 4'b0110, F = 4'b0100, G = 4'b0101, H = 4'b0111,  I = 4'b1111, J = 4'b1101, K = 4'b1100, L = 4'b1110, M = 4'b1010, N = 4'b1011, O = 4'b1001;
	
	// Sequencing Method
	parameter  A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111,  I = 4'b1000, J = 4'b1001, K = 4'b1010, L = 4'b1011, M = 4'b1100, N = 4'b1101, O = 4'b1110;
	
	
	// generate the next state logic
	always @(posedge iClk)
	begin	
		if (iRst) oState = A;
		else begin
    		case (oState)
    			A: case(w)
    		      4'b11: oState = J;
    				4'b10: oState = F;
    				4'b01: oState = N;
    				4'b00: oState = B;
    				endcase
    			B: case(w)
    				4'b11: oState = K;
    				4'b10: oState = G;
    				4'b01: oState = O;
    				4'b00: oState = C;
    				endcase
    			C: case(w)
    				4'b11: oState = L;
    				4'b10: oState = H;
    				4'b01: oState = A;
    				4'b00: oState = D;
    				endcase
    			D: case(w)
    				4'b11: oState = M;
    				4'b10: oState = I;
    				4'b01: oState = B;
    				4'b00: oState = E;
    				endcase
    			E: case(w)
    				4'b11: oState = N;
    				4'b10: oState = J;
    				4'b01: oState = C;
    				4'b00: oState = F;
    				endcase
    			F: case(w)
    				4'b11: oState = O;
    				4'b10: oState = K;
    				4'b01: oState = D;
    				4'b00: oState = G;
    				endcase
    			G: case(w)
    				4'b11: oState = A;
    				4'b10: oState = L;
    				4'b01: oState = E;
    				4'b00: oState = H;
    				endcase
    			H: case(w)
    				4'b11: oState = B;
    				4'b10: oState = M;
    				4'b01: oState = F;
    				4'b00: oState = I;
    				endcase
    			I: case(w)
    				4'b11: oState = C;
    				4'b10: oState = N;
    				4'b01: oState = G;
    				4'b00: oState = J;
    				endcase
    			J: case(w)
    				4'b11: oState = D;
    				4'b10: oState = O;
    				4'b01: oState = H;
    				4'b00: oState = K;
    				endcase
    			K: case(w)
    				4'b11: oState = E;
    				4'b10: oState = A;
    				4'b01: oState = I;
    				4'b00: oState = L;
    				endcase
    			L: case(w)
    				4'b11: oState = F;
    				4'b10: oState = B;
    				4'b01: oState = J;
    				4'b00: oState = M;
    				endcase
    			M: case(w)
    				4'b11: oState = G;
    				4'b10: oState = C;
    				4'b01: oState = K;
    				4'b00: oState = N;
    				endcase
    			N: case(w)
    				4'b11: oState = H;
    				4'b10: oState = D;
    				4'b01: oState = L;
    				4'b00: oState = O;
    				endcase
    			O: case(w)
    				4'b11: oState = I;
    				4'b10: oState = E;
    				4'b01: oState = M;
    				4'b00: oState = A;
    				endcase
    			default: oState = A;
    		endcase
    	end	
	end
	
	
	// Base on State, declare the output
	always @(oState) begin
		case (oState)
			4'b0000: oV <= 4'b0011;//3 
			4'b0001: oV <= 4'b0010;
			4'b0010: oV <= 4'b0110;
			4'b0011: oV <= 4'b1000;
			4'b0100: oV <= 4'b1000;
			4'b0101: oV <= 4'b0000;
			4'b0110: oV <= 4'b0101;
			4'b0111: oV <= 4'b0100;
			4'b1000: oV <= 4'b0100;
			4'b1001: oV <= 4'b0111;
			4'b1010: oV <= 4'b0100;
			4'b1011: oV <= 4'b0101;
			4'b1100: oV <= 4'b0000;
			4'b1101: oV <= 4'b0001;
			4'b1110: oV <= 4'b1000;
			4'b1111: oV <= 4'bxxxx;
		endcase
	end
	
	
endmodule
 
 
//1ll1l11l11l11ll1l11111l111111l1ll111 Module AssignmentTestBench 1ll1l11l11l11ll1l11111l111111l1ll111
//
//   This testbench needs to check all possible transitions in your counter design.
//   It should be written using an independent approach to the synthesisable code above
//
//1ll1l11l11l11ll1l11111l111111l1ll111 Module AssignmentTestBench 1ll1l11l11l11ll1l11111l111111l1ll111
 
module AssignmentTestBench;
// define the inputs
reg iClk, iRst, iSkip, iRev;
// define the outputs
wire[3:0] state,v,altstate,altv;
// create a reg to store number of errors
reg [5:0] Error = 6'd0; 

// call Complete Counter and its Alternative
CompleteCounter cc(iClk, iRst, iSkip, iRev,v,state);
AltCompleteCounter altcc(iClk, iRst, iSkip, iRev,altv,altstate);
// define initial conditions
initial begin 
	iSkip = 0;
	iRev = 0;
	iRst = 1;
	iClk = 0;
	$dumpfile("Assignment.vcd"); $dumpvars;
end
// clock cycle every 5 ns
always begin
	#5 iClk = ~iClk;
end
// oiterate through all posible combinations of Rev and Skip
always begin
	iSkip = 0;
	iRev = 0;
	#10
	if(iRst) iRst = 0;
	#200 iSkip = 1;
	#200 iRev =1;
	#200 iSkip = 0;
	#200 iRev = 0;
end

always @(posedge iClk) begin
	#1
	if((v != altv) | (state != altstate)) begin
	Error = Error + 1;
	end
end

endmodule //1ll1l11l11l11ll1l11111l111111l1ll111 AssignmentTestBench 1ll1l11l11l11ll1l11111l111111l1ll111 

module BCD(in, Hex);
	input [3:0] in;
	output reg [6:0] Hex;
	always @(in) begin
		case (in)
			4'd0:  Hex = 7'b1000000; 	
			4'd1:  Hex = 7'b1111001;
			4'd2:  Hex = 7'b0100100;
			4'd3:  Hex = 7'b0110000;
			4'd4:  Hex = 7'b0011001;
			4'd5:  Hex = 7'b0010010;
			4'd6:  Hex = 7'b0000010;
			4'd7:  Hex = 7'b1111000;
			4'd8:  Hex = 7'b0000000;
			4'd9:  Hex = 7'b0011000;
			default: Hex = 7'bxxxxxxx;
		endcase
	end
endmodule

