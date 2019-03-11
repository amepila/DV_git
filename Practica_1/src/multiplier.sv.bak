module multiplier #(
    parameter DW = 8,
    parameter D2W = DW*2
    )(
    input           i_clk,
    input           i_rst,
    input           i_load,
    input  [DW-1:0] i_data,

    output [D2W-1:0] o_data,
    output           o_lsb
    );

    logic [D2W-1:0] r_mlter;

    always_ff@(posedge i_clk or negedge i_rst) begin
        if(!i_rst)
            r_mlter  <= '0;
        else if (i_load)
            r_mlter  <= i_data;
        else
            r_mlter  <= r_mlter >> 1'b1;
    end

    assign o_data  = r_mlter;
    assign o_lsb   = r_mlter[0];

endmodule
