module adder
import mult_pkg::*;
(
	input							i_clk,
	input 						i_rst,
	input							i_ready,
	input 						i_enable,
	input   						i_clean,
	input multiplicand_t		i_valB,

	output product_t			o_sum
);

product_t	r_product;

always@(posedge i_clk) begin:add
	if (i_clean)
		r_product <= '0; 
	else if (i_enable)
		r_product <= r_product + i_valB;
	else
		r_product <= r_product;
end:add
 
assign o_sum = (i_ready) ? r_product : '0;

endmodule 