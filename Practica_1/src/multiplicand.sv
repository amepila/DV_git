module multiplicand 
import mult_pkg::*;
(
	input    		i_clk,
	input    		i_rst,
	input				i_load,
	input data_t	i_data,

	output multiplicand_t o_data
);

multiplicand_t		r_multiplicand;

always_ff@(posedge i_clk, negedge i_rst) begin: shift_left
	 if(!i_rst)
		  r_multiplicand  <= '0;
	 else if (i_load)
		  r_multiplicand  <= i_data;
	 else
		  r_multiplicand  <= r_multiplicand << 1'b1;
end:shift_left

assign o_data = r_multiplicand;
	
endmodule
