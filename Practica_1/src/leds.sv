module leds
import leds_pkg::*;
(
	input					i_clk,
	input					i_rst,
	input	product_t 	i_product,
	input					i_sign,
	input 				i_ready,
	
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
	output				o_ready
);

assign o_led0 	= i_product[0];
assign o_led1 	= i_product[1];
assign o_led2 	= i_product[2];
assign o_led3 	= i_product[3];
assign o_led4 	= i_product[4];
assign o_led5 	= i_product[5];
assign o_led6 	= i_product[6];
assign o_led7 	= i_product[7];
assign o_led8 	= i_product[8];
assign o_led9 	= i_product[9];
assign o_led10 = i_product[10];
assign o_led11 = i_product[11];
assign o_led12 = i_product[12];
assign o_led13 = i_product[13];
assign o_led14 = i_product[14];
assign o_led15 = i_product[15];
assign o_led16 = i_sign;
assign o_ready = i_ready;

endmodule
