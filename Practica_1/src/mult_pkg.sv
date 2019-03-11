package mult_pkg;

localparam DW = 8;
localparam D2W = DW*2;
typedef	logic [DW:0]comp2_t;
typedef	logic [DW-1:0]data_t;
typedef	logic [D2W-1:0]multiplier_t;
typedef	logic [D2W-1:0]multiplicand_t;
typedef	logic [D2W-1:0]product_t;
typedef	logic signal_t;

typedef struct
{
	signal_t				clkPLL;
	signal_t				clk;
	signal_t				finalSign;
	product_t			finalProduct;
	comp2_t				real_mltnd;
	comp2_t				real_mlter;
	product_t			product;
	signal_t				sign_mltnd;
	signal_t				sign_mlter;
	data_t				data_mltnd;
	data_t				data_mlter;
	signal_t				ready;
	signal_t				load;
	signal_t				lsb;
	signal_t				clean;
	multiplicand_t		mltnd_out;
}ms_t;

endpackage: mult_pkg
