module multiplicand #(
	parameter DW = 8,
	parameter D2W = DW*2
	)(
	input       	i_clk,
	input       	i_rst,
	input			i_load,
	input  [DW-1:0]	i_data,

	output [D2W-1:0] o_data
	
	);

	logic [D2W-1:0] r_mltnd;

	always_ff@(posedge i_clk or negedge i_rst) begin
	    if(!i_rst)
	        r_mltnd  <= '0;
	    else if (i_load)
            r_mltnd  <= i_data;
        else
            r_mltnd  <= r_mltnd << 1'b1;
	end

	assign o_data  = r_mltnd;
	
endmodule
