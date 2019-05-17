`ifndef MXV_PKG_SV
    `define MXV_PKG_SV

package mxv_pkg;

    /*    import mxv_pkg::*;    */

    /* PARAMETERS ------------------------------- */

    localparam  DW  = 255;
    localparam  DIW = $clog2(DW);
    localparam  RW  = $clog2(DW*DW*8);

    localparam  MUX_IN_2 = 2;
    localparam  DMX_IN_2 = 2;
    localparam  SLTR_2   = $clog2(DMX_IN_2);
    localparam  DMX_IN_4 = 4;
    localparam  SLTR_4   = $clog2(DMX_IN_4);
    localparam  DMX_IN_8 = 8;
    localparam  SLTR_8   = $clog2(DMX_IN_8);

    localparam  DWUART  = 8;
    localparam  DHEX    = 4;
    localparam  DDEC    = 8;

    localparam  KEY_0   = 48;
    localparam  KEY_9   = 56;
    localparam  KEY_A   = 65;
    localparam  KEY_F   = 70;

    localparam SIPO_REG = 14;
    localparam CW       = 7;
    localparam NMAX     = 8;
    localparam NW       = $clog2(NMAX);

    localparam SIZE_FRAME        = {8'hF,8'hE,"_","0","3","_","0","1","_","0",8'b????_????,"_","E","F"};
    localparam START_FRAME       = {"F","E","_","0","2","_","0","3","_","E","F"};
    localparam MATRIX_FRAME      = {"F","E","_",8'b????_????,8'b????_????,"_","0","4","_"};
    localparam END_FIFO_FRAME    = 
    localparam END_MATRIX_FRAME  = 
    localparam VECTOR_FRAME      = 
    localparam FIFO_VECTOR_FRAME = 
    localparam END_VECTOR_FRAME  = 
    localparam REPEAT_FRAME      = 
    localparam ERROR_FRAME       = 

    /* TYPEDEFS -------------------------------- */

    typedef logic [DW-1:0]       data_t;
    typedef logic [DIW-1:0]      data_i_t;
    typedef logic [RW-1:0]       result_t;
    typedef logic [MUX_IN_2-1:0] mux_2_1_t [DIW-1:0];
    typedef logic [SLTR_2-1:0]   sltr_2_t;
    typedef logic [DMX_IN_8-1:0] dmx_1_8_w4b_t [DIW-1:0];
    typedef logic [SLTR_8-1:0]   sltr_8_t;
    typedef logic [DMX_IN_8-1:0] dmx_1_8_w1b_t;
    typedef logic [SLTR_4-1:0]   sltr_4_t;
    typedef logic [DMX_IN_4-1:0] dmx_1_4_w4b_t [DIW-1:0];

   
    typedef logic [DMX_IN_4-1:0] dmx_1_2_w4b_t [DHEX-1:0];
    typedef logic [DMX_IN_4-1:0] dmx_1_2_w8b_t [DDEC-1:0];

    typedef logic [DWUART-1:0]   data_uart_t;
    typedef logic [DHEX-1:0]     data_hex_t;
    typedef logic [DHEX-1:0]     data_hex_sipo_t [SIPO_REG-1:0];
    typedef logic [DDEC-1:0]     data_dec_t;
    typedef logic [DHEX-1:0]     data_h2d_reg_t  [1:0];

    typedef logic [CW-1:0]       count_t;
    typedef logic [NW-1]         n_t;

    /* ENUMS ----------------------------------- */

    typedef enum logic [4:0] {IDLE, SIZE, START, MATRIX, 
                              FIFO_0, FIFO_1, FIFO_2, FIFO_3,
                              FIFO_4, FIFO_5, FIFO_6, FIFO_7, FIFO_GUION,
                              END_FIFO_M,END_MATRIX,VECTOR, FIFO_VECTOR, 
                              END_VECTOR, REPEAT, CLEAN} state_ctrl_t;

/*    typedef enum logic [3:0] {SIZE_FRAME, START_FRAME,MATRIX_FRAME, END_FIFO_FRAME,
                              END_MATRIX_FRAME, VECTOR_FRAME, FIFO_VECTOR_FRAME, 
                              END_VECTOR_FRAME, REPEAT_FRAME, ERROR_FRAME} frames_t;*/

    /* STRUCTS --------------------------------- */

    typedef struct {

        data_i_t     ctrl_data;
        logic        ctrl_push;
        logic        ctrl_pop;

        data_t        matrix_val;
        sltr_8_t      dmx_sltr;

        dmx_1_8_w4b_t dmx_fifo;
        dmx_1_8_w1b_t dmx_push;
        dmx_1_8_w1b_t dmx_pop;

        data_t        vector_val;
        sltr_4_t      dmx_4_sltr;
        data_i_t      fifo_dmx_vctr;
        dmx_1_4_w4b_t dmx_prcsr_vctr;

        data_i_t      fifo_vector;
        logic         push_vector;
        logic         pop_vector;

        data_t        data_fifo_0;
        data_t        data_fifo_1;
        data_t        data_fifo_2;
        data_t        data_fifo_3;
        data_t        data_fifo_4;
        data_t        data_fifo_5;
        data_t        data_fifo_6;
        data_t        data_fifo_7;

        data_i_t      matrix_0_4;
        data_i_t      matrix_1_5;
        data_i_t      matrix_2_6;
        data_i_t      matrix_3_7;

        result_t      result_mux;
        result_t      result_a;
        result_t      result_reg_a;
        result_t      result_b;
        result_t      result_reg_b;
        result_t      result_c;
        result_t      result_reg_c;
        result_t      result_d;
        result_t      result_reg_d;

        logic         mux_x_r_sltr;
        logic         mux_0_4_sltr;
        logic         mux_1_5_sltr;
        logic         mux_2_6_sltr;
        logic         mux_3_7_sltr;

        logic         ena_prcs_a;
        logic         ena_prcs_b;
        logic         ena_prcs_c;
        logic         ena_prcs_d;

        logic         ena_reg_a;
        logic         ena_reg_b;
        logic         ena_reg_c;
        logic         ena_reg_d;

   
        logic         push_result;
        logic         pop_result;
        data_i_t      fifo_result;

    }mxv_st; 
    
endpackage
`endif

