`ifndef REGISTER_1_SV
    `define REGISTER_1_SV

module register_1
import mxv_pkg::*;
(
	input  clk,
	input  rst,

	input  logic i_val,

	output logic o_val
);


always_ff @(posedge clk, negedge rst) begin
	if(!rst) 
		o_val <= '0;

	else 
		o_val <= i_val;
end

endmodule
`endif