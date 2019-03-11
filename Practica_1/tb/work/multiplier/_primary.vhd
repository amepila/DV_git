library verilog;
use verilog.vl_types.all;
entity multiplier is
    generic(
        DW              : integer := 8;
        D2W             : vl_notype
    );
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_load          : in     vl_logic;
        i_data          : in     vl_logic_vector;
        o_data          : out    vl_logic_vector;
        o_lsb           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
    attribute mti_svvh_generic_type of D2W : constant is 3;
end multiplier;
