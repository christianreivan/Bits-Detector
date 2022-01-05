module fsm3			// Design a sequential circuit that detects consecutive inputs: "1" 
( input clk, rst,		// and directly followed by '0'. The overlapped sequence is permitted.
  input in,
  output z
);

parameter A = 2'd0;		// parameters used as alias for states representation
parameter B = 2'd1;
parameter C = 2'd2;

reg [1:0] state;			// Only requires two bits for 3 states

// Combinational -> Output
assign z = (state == A) ? 1'b0 : (state == B) ? 1'b0 : 1'b1;

// Sequential -> States Register
always @(posedge clk, negedge rst) begin
	if (~rst) begin
		state <= A;
	end
	
	else begin
		case (state)
			A: begin
				if (in == 1'b0) begin
					state <= A;
				end
				
				else begin
					state <= B;
				end
				end
			
			B: begin
				if (in == 1'b0) begin
					state <= C;
				end
				
				else begin
					state <= B;
				end
				end
			
			C:	begin
				if (in == 1'b0) begin
					state <= A;
				end
				
				else begin
					state <= B;
				end
				end
			
			default:	begin
						end
		
		endcase
	end
	
end

endmodule

////////////////// TESTBENCH ///////////////

module fsm3_tb();

reg clk, rst;
reg in;
wire z;

fsm3 FSM3_TB (clk, rst, in, z);

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
