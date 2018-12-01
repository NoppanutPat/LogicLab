module regis(inp_r,load,clear,out_r);
	input logic[7:0] inp_r;
	input logic load,clear;
	output logic[7:0] out_r;
	logic clk;
	
	PLL pll_component( clk );
	always_ff @(posedge clk) begin
			if (clear == 1) begin
				out_r = 0; end
			else if (clear == 0 && load == 1) begin
				out_r = inp_r; end
			else if (load == 0) begin
				out_r = out_r; end
			end
endmodule


module shifter(inp_s,func,out_s);
	input logic[7:0] inp_s;
	input logic[1:0] func;
	output logic[7:0] out_s;
	
	always begin
	
		if (func == 2'b00) begin
			out_s = inp_s; end
		else if (func == 2'b01) begin
			out_s = inp_s << 1; end
		else if (func[0] == 1) begin
			out_s = inp_s >> 1; end
		
	end
endmodule


module Ex1(sel_1,sel_2,func,load,clk,clear,out);
	logic[7:0] out_1,out_2,out_3;
	input logic sel_1,sel_2,load,clear,clk;
	input logic[1:0] func;
	output logic[7:0] out;
	
	always begin
	
		if (sel_1 == 0) begin
			out_1 = 2'b10000000; end
		else if (sel_1 == 1) begin
			out_1 = 2'b00000001; end
		
		if (sel_2 == 0) begin
			out_2 = out_1; end
		else if (sel_2 == 1) begin
			out_2 = out; end
		
	end
	
	shifter s1(.inp_s(out_2),.func(func),.out_s(out_3));
		
	regis r1(.inp_r(out_3),.load(load),.clear(clear),.out_r(out));

	
endmodule	
		
		
		
		
		
		