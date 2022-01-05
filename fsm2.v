// Design a sequential circuit that detects consecutive inputs: "1" 
// and directly followed by '0'. The overlapped sequence is permitted.
module fsm2		
( input clk, rst,
  input in,
  output z
);

parameter A = 2'd0;		// parameters used as alias for states representation
parameter B = 2'd1;
parameter C = 2'd2;

// Nextstate and State
reg [1:0] state, nstate;	// Only requires two bits for 3 states

// Separate Combinational -> Output
assign z = (state == A) ? 1'b0 : (state == B) ? 1'b0 : 1'b1;

// Sequential -> State Register
always @(posedge clk, negedge rst) begin
	if (~rst) begin
		state <= A;
	end
	
	else begin
		state <= nstate;
	end
end

// Combinational -> Nextstate Logics 
always @(*) begin
	case (state)
		A: begin
			if (in == 1'b0) begin
				nstate = A;
			end
			
			else begin
				nstate = B;
			end
			end
		
		B: begin
			if (in == 1'b0) begin
				nstate = C;
			end
			
			else begin
				nstate = B;
			end
			end
		
		C:	begin
			if (in == 1'b0) begin
				nstate = A;
			end
			
			else begin
				nstate = B;
			end
			end
		
		default:	begin
					end
	
	endcase
end

endmodule

////////////////// TESTBENCH ///////////////

module fsm2_tb();

reg clk, rst;
reg in;
wire z;

fsm2 FSM2_TB (clk, rst, in, z);

initial begin
    clk = 1'b0;
    rst = 1'b0;
	 in  = 1'b0;
end

always begin
    #50
    clk = ~clk;
end

initial begin
    #100
    rst = 1'b1;
    #50
    in = 1'b1;
	 #100
	 in = 1'b1;
	 #100
	 in = 1'b0;
	 #100
	 in = 1'b1;
	 #100
	 in = 1'b0;
	 #100
	 in = 1'b0;
	 #100
	 in = 1'b1;
	 #100
	 in = 1'b0;
	 #100
	 in = 1'b1;
	 #200;
end

endmodule
