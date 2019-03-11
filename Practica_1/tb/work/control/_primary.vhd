library verilog;
use verilog.vl_types.all;
entity control is
    generic(
        BW              : integer := 8;
        DW              : vl_notype
    );
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_start         : in     vl_logic;
        o_load          : out    vl_logic;
        o_stop          : out    vl_logic;
        o_clean         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BW : constant is 1;
    attribute mti_svvh_generic_type of DW : constant is 3;
end control;
