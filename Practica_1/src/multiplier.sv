module multiplier 
import mult_pkg::*;
(
	input          	i_clk,
	input       	   i_rst,
   input 				i_load,
   input  	data_t	i_data,

   output   			o_lsb
	//output				o_empty
);

multiplier_t	r_multiplier;

always_ff@(posedge i_clk, negedge i_rst) begin:shift_right
	if(!i_rst)
		r_multiplier  <= '0;
	else if (i_load)
		r_multiplier  <= i_data;
	else
		r_multiplier  <= r_multiplier >> 1'b1;
end:shift_right

//assign o_empty = (r_multiplier == '0) ? 1'b1: 1'b0;
assign o_lsb = r_multiplier[0];

endmodule
