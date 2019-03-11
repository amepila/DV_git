module ms#(
	parameter DW = 8,
	parameter D2W = DW*2
	)(
	input 			i_clk,
	input 			i_rst,
	input 			i_start,
	input  [DW-1:0] i_mltnd_val,
	input  [DW-1:0] i_mlter_val,

	output 	[D2W:0] o_product,
	output 		   o_stop
	);

	wire 		    w_load;
	wire  		    w_lsb;
	wire  		    w_clean;
	wire  [D2W-1:0] w_mltnd_out;
	wire  [D2W-1:0] w_mlter_out;


	control SM(
		.i_clk	  (i_clk),
		.i_rst 	  (i_rst),
		.i_start  (i_start),

		.o_load   (w_load),
		.o_stop	  (o_stop),
		.o_clean  (w_clean)
	);

	multiplicand MULTIPLICAND(
		.i_clk	 (i_clk),
		.i_rst 	 (i_rst),
		.i_load	 (w_load),
		.i_data	 (i_mltnd_val), // [DW-1:0]

		.o_data	 (w_mltnd_out)  // [DW-1:0]
	);

	multiplier MULTIPLIER(
		.i_clk	(i_clk),
		.i_rst  (i_rst),
		.i_load (w_load),
		.i_data	(i_mlter_val), 

		.o_lsb 	(w_lsb),
		.o_data	(w_mlter_out) 	// [DW-1:0]
	);

	full_adder ADD(
		.i_clk	 (i_clk),
		.i_ena   (w_lsb),
		.i_clean (w_clean), 	//[DW-1:0]
		.i_valB  (w_mltnd_out), //[DW-1:0]

		.o_sum   (o_product)	//[DW-1:0]
	);

endmodule