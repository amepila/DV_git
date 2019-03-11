module ms
import mult_pkg::*;
(
	input 				i_clk,
	input 				i_rst,
	input 				i_start,
	input					i_sw0,
	input					i_sw1,
	input					i_sw2,
	input					i_sw3,
	input					i_sw4,
	input					i_sw5,
	input					i_sw6,
	input					i_sw7,
	input					i_sw8,
	input					i_sw9,
	input					i_sw10,
	input					i_sw11,
	input					i_sw12,
	input					i_sw13,
	input					i_sw14,
	input					i_sw15,
	input					i_sw16,
	input					i_sw17,

	output				o_led0,
	output				o_led1,
	output 				o_led2,
	output				o_led3,
	output				o_led4,
	output				o_led5,
	output				o_led6,
	output				o_led7,
	output				o_led8,
	output				o_led9,
	output				o_led10,
	output				o_led11,
	output				o_led12,
	output				o_led13,
	output				o_led14,
	output				o_led15,
	output				o_led16,
	output 		   	o_ready,
	
	output				TEST
);

	ms_t	wires_ms;
	
	PLL PLL_HZ(
		.inclk0		(i_clk),
		
		.c0			(wires_ms.clkPLL)
	);
	
	clkDivider CLOCK_DIVIDER(
		.i_reset		(i_rst),
		.i_clk_FPGA	(wires_ms.clkPLL),
		
		.o_clk		(wires_ms.clk)
	);
	
	control SM(
		.i_clk	  	(wires_ms.clk),
		.i_rst 	  	(i_rst),
		.i_start  	(i_start),

		.o_load   	(wires_ms.load),
		.o_ready	  	(wires_ms.ready),
		.o_clean  	(wires_ms.clean)
	);
	
	switch SW(
		.i_clk		(wires_ms.clk),
		.i_rst		(i_rst),
		.i_sw0		(i_sw0),
		.i_sw1		(i_sw1),
		.i_sw2		(i_sw2),
		.i_sw3		(i_sw3),
		.i_sw4		(i_sw4),
		.i_sw5		(i_sw5),
		.i_sw6		(i_sw6),
		.i_sw7		(i_sw7),
		.i_sw8		(i_sw8),
		.i_sw9		(i_sw9),
		.i_sw10		(i_sw10),
		.i_sw11		(i_sw11),
		.i_sw12		(i_sw12),
		.i_sw13		(i_sw13),
		.i_sw14		(i_sw14),
		.i_sw15		(i_sw15),
		.i_sw16		(i_sw16),
		.i_sw17		(i_sw17),
		
		.o_multiplier		(wires_ms.real_mlter),
		.o_multiplicand	(wires_ms.real_mltnd)
	);
	
	complement2 COMP2_MULTIPLICAND(
		.i_start		(i_start),
		.i_val		(wires_ms.real_mltnd),
		
		.o_val		(wires_ms.data_mltnd),
		.o_sign		(wires_ms.sign_mltnd)
	);
	
	complement2 COMP2_MULTIPLIER(
		.i_start		(i_start),
		.i_val		(wires_ms.real_mlter),
		
		.o_val		(wires_ms.data_mlter),
		.o_sign		(wires_ms.sign_mlter)
	);

	multiplicand MULTIPLICAND(
		.i_clk	 	(wires_ms.clk),
		.i_rst 	 	(i_rst),
		.i_load	 	(wires_ms.load),
		.i_data	 	(wires_ms.data_mltnd), // [DW-1:0]

		.o_data	 	(wires_ms.mltnd_out)  // [DW-1:0]
	);

	multiplier MULTIPLIER(
		.i_clk		(wires_ms.clk),
		.i_rst  		(i_rst),
		.i_load 		(wires_ms.load),
		.i_data		(wires_ms.data_mlter), 

		.o_lsb 		(wires_ms.lsb)
	);

	adder ADDER(
		.i_clk	 	(wires_ms.clk),
		.i_rst	 	(i_rst),
		.i_ready		(wires_ms.ready),
		.i_enable   (wires_ms.lsb),
		.i_clean 	(wires_ms.clean), 	//[DW-1:0]
		.i_valB  	(wires_ms.mltnd_out), //[DW-1:0]

		.o_sum   	(wires_ms.product)	//[D2W:0]
	);
	
	comp2Product COMP2_PRODUCT(
		.i_val		(wires_ms.product),
		.i_signA		(wires_ms.sign_mltnd),
		.i_signB		(wires_ms.sign_mlter),
		
		.o_product	(wires_ms.finalProduct),
		.o_sign		(wires_ms.finalSign)
	);
	
	leds LED(
		.i_clk		(wires_ms.clk),
		.i_rst		(i_rst),
		.i_product	(wires_ms.finalProduct),
		.i_sign		(wires_ms.finalSign),
		.i_ready		(wires_ms.ready),
		
		.o_led0		(o_led0),
		.o_led1		(o_led1),
		.o_led2		(o_led2),
		.o_led3		(o_led3),
		.o_led4		(o_led4),
		.o_led5		(o_led5),
		.o_led6		(o_led6),
		.o_led7		(o_led7),
		.o_led8		(o_led8),
		.o_led9		(o_led9),
		.o_led10		(o_led10),
		.o_led11		(o_led11),
		.o_led12		(o_led12),
		.o_led13		(o_led13),		
		.o_led14		(o_led14),
		.o_led15		(o_led15),
		.o_led16		(o_led16),
		.o_ready		(o_ready)
	);

assign TEST = wires_ms.clk;
endmodule
