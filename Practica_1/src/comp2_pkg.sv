package comp2_pkg;

localparam DW = 8;
localparam D2W = DW*2;
typedef logic [DW:0]val_t;
typedef logic [DW-1:0]out_t;
typedef logic [D2W-1:0]product_t;
typedef logic sign_t;

typedef struct
{
	out_t		val;
	sign_t	sign;
}comp2_t;

endpackage
