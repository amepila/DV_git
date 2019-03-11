module comp2Product
import comp2_pkg::*;
(
	input		product_t	i_val,
	input						i_signA,
	input						i_signB,
	
	output	product_t	o_product,
	output					o_sign
);

assign o_product 	= (i_signA ^ i_signB) ? ((~i_val) + 1'b1) : i_val;
assign o_sign 		= (i_signA ^ i_signB);

endmodule
