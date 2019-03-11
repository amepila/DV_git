package control_pkg;

localparam BW = 8;
localparam DW = $clog2(BW);
localparam MAX_CNTR = BW - 1'b1;
typedef logic signal_t;
typedef logic [DW:0] count_t;
typedef enum logic [2:0]{IDLE, INIT, ADD_SHIFT} state_t;

typedef struct
{
	signal_t	load;
	signal_t	ready;
	signal_t	clean;
	count_t	count;
	state_t	state;
}control_t;

endpackage: control_pkg