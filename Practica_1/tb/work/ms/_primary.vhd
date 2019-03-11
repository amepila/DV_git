library verilog;
use verilog.vl_types.all;
entity ms is
    generic(
        DW              : integer := 8;
        D2W             : vl_notype
    );
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_start         : in     vl_logic;
        i_mltnd_val     : in     vl_logic_vector;
        i_mlter_val     : in     vl_logic_vector;
        o_product       : out    vl_logic_vector;
        o_stop          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
    attribute mti_svvh_generic_type of D2W : constant is 3;
end ms;
