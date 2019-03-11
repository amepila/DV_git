library verilog;
use verilog.vl_types.all;
entity tb_ms is
    generic(
        DW              : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end tb_ms;
