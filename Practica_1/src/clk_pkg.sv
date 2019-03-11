package clk_pkg;

localparam	FREQUENCY_IN 	= 10000;
localparam	FREQUENCY_OUT	= 1;
localparam	MAX_COUNT		= (FREQUENCY_IN/FREQUENCY_OUT)/2;
typedef logic [31:0] counter_t;

endpackage: clk_pkg