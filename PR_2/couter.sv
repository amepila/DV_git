`ifndef COUNTER_SV
    `define COUNTER_SV
    
module counter
import pkg_system_mdr::*;
(
    input           clk,
    input           rst,

    input           i_enable,

    output          o_counter,
    output  logic   o_ovf
);

count_t r_count = '0;

always_ff@(posedge clk, negedge rst)begin
    if (!rst)
        r_count     <=  '0;
    else if (i_enable)
        r_count     <= r_count + 1'b1;
    else
    	r_count 	<=  '0;
end

always_comb begin
    if (r_count > DW)
        o_ovf     =   1'b1;    
    else
        o_ovf     =   1'b0;
end


assign o_counter = r_count; 

endmodule
`endif