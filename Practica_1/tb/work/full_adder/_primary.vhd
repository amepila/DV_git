library verilog;
use verilog.vl_types.all;
entity full_adder is
    generic(
        DW              : integer := 8;
        D2W             : vl_notype
    );
    port(
        i_clk           : in     vl_logic;
        i_ena           : in     vl_logic;
        i_clean         : in     vl_logic;
        i_valB          : in     vl_logic_vector;
        o_sum           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
    attribute mti_svvh_generic_type of D2W : constant is 3;
end full_adder;
