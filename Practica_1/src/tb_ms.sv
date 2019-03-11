module tb_ms
#(
	parameter DW = 8 
)();
	bit 				TB_clk = 0;
	bit 				TB_rst;
	bit 				TB_start;
	logic  [DW-1:0]TB_multd_val; //[DW-1:0]
	logic  [DW-1:0]TB_multr_val; //[DW-1:0]

	logic [15:0]	TB_product;
	logic 	 		TB_ready;

	ms TOP(
		.i_clk 			(TB_clk),
		.i_rst 			(TB_rst),
		.i_start 		(TB_start),
		.i_mltnd_val	(TB_multd_val), //[DW-1:0]
		.i_mlter_val	(TB_multr_val), //[DW-1:0]

		.o_product 		(TB_product),
		.o_ready 		(TB_ready)
	);

	always #1 TB_clk <= ~TB_clk;

	initial begin
	    TB_rst    	 	= 0;     #2;
	    TB_rst   	 	= 1;     #3;

	    TB_multd_val 	= 3; 	
	    TB_multr_val 	= 5; 		#4;
 
	    TB_start 	 	= 1;     #2;
	    TB_start  	 	= 0;     #20;

	    TB_multd_val 	= 20; 	
	    TB_multr_val 	= 12; 	#4;
 
	    TB_start 	 	= 1;     #2;
	    TB_start  	 	= 0;     #20;

	    TB_multd_val 	= 32; 	
	    TB_multr_val 	= 100; 	#4;
 
	    TB_start 	 	= 1;     #2;
	    TB_start  	 	= 0;     #20;
	end

endmodule // tb_ms