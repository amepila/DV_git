`ifndef SHIFT_LEFT_SV
    `define SHIFT_LEFT_SV

module shift_left 
import pkg_system_mdr::*;
#(	parameter SHIFT = 1
)(
	input 			clk,
	input 			rst,

	input data_t 	i_val,
	input 			i_init,
	input 			i_enable,

	output data_t 	o_val
);

data_t r_val = '0;

always_ff @(posedge clk or negedge rst) begin
	if(~rst) 
		r_val <= '0;
	 
	else if (i_init)
		r_val <= i_val;
	
	else if (i_enable)
		r_val <= r_val >> SHIFT;

	else
		r_val <= r_val;

end

assign o_val = r_val;

endmodule
`endif