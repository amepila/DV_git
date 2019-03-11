module full_adder#(
	parameter DW = 8,
	parameter D2W = DW*2
	)(
	input           i_clk,
	input 			i_ena,
	input   		i_clean,
	input  [D2W-1:0] i_valB,

	output [D2W:0]   o_sum
	);

	logic [D2W:0] r_product = '0;


	always @(posedge i_clk)begin
		if (i_clean)begin
			r_product = '0; 
		end
		else if (i_ena)begin
			r_product = r_product + i_valB;
		end
		else begin
			r_product = r_product;
		end
	end
	 
	assign o_sum	= r_product;

endmodule