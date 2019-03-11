package switch_pkg;

localparam DW = 8;
typedef logic [DW:0]data_t;

typedef struct
{
	data_t	multiplier;
	data_t	multiplicand;
}registers_t;

endpackage: switch_pkg