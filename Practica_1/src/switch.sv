module switch
import switch_pkg::*;
(
	input				i_clk,
	input				i_rst,
	input				i_sw0,
	input				i_sw1,
	input				i_sw2,
	input				i_sw3,
	input				i_sw4,
	input				i_sw5,
	input				i_sw6,
	input				i_sw7,
	input				i_sw8,
	input				i_sw9,
	input				i_sw10,
	input				i_sw11,
	input				i_sw12,
	input				i_sw13,
	input				i_sw14,
	input				i_sw15,
	input				i_sw16,
	input				i_sw17,
	
	output  data_t	o_multiplier,
	output  data_t	o_multiplicand
);

registers_t r_data;

always_ff@(posedge i_clk, negedge i_rst) begin: SWITCH 
	if(!i_rst) begin
		r_data.multiplier 	<= '0;
		r_data.multiplicand	<= '0;
	end
	else begin
		r_data.multiplier		<= {i_sw8,i_sw7,i_sw6,i_sw5,i_sw4,i_sw3,i_sw2,i_sw1,i_sw0};
		r_data.multiplicand	<= {i_sw17,i_sw16,i_sw15,i_sw14,i_sw13,i_sw12,i_sw11,i_sw10,i_sw9};
	end
end: SWITCH 

assign o_multiplier 		= r_data.multiplier;
assign o_multiplicand 	= r_data.multiplicand;

endmodule
