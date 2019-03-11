module complement2
import comp2_pkg::*;
(
	input					i_start,
	input 		val_t	i_val,
	
	output	 	out_t	o_val,
	output				o_sign
);

	/*El MSB indica si el signo es positivo o negativo, 
	**en caso de ser positivo se hace complemento A2
	**de lo contrario el valor continua igual */
comp2_t comp2;

always_comb begin: inputs
	if(i_start == 1'b1)begin
		comp2.val 	= ( i_val[DW] ) ? ( ~(i_val[DW-1:0] - 1'b1)) : i_val[DW-1:0]; 
		comp2.sign 	= i_val[DW];
	end
	else begin
		comp2.val 	= '0;
		comp2.sign 	= '0;
	end
end: inputs

assign o_val   = comp2.val;
assign o_sign 	= comp2.sign;
	
endmodule
