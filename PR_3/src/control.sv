`ifndef CONTROL_SV
    `define CONTROL_SV

module control
import mxv_pkg::*;
(
	input clk_wr,
	input clk_rd,
	input rst,

	input        rcv,
	//input frames_t frame,
	input logic    error,
	input count_t  count,
	input logic    match,
	input logic    repeat,
	input n_t      n,

	output state_ctrl_t state_out
);

    state_ctrl_t state;

    always@(posedge clk_wr, negedge rst)begin
    	if (!rst)begin
    		state = IDLE;
    	end
    	else begin
    		case(state)
    			IDLE: begin
    				if (rcv)
    					state = SIZE;
    			end
    			SIZE: begin
					if (error)
						state = CLEAN;
					else if ( match )
						state = START;
					else if ( repeat )
						state = REPEAT;
					else
						state = SIZE;
    			end
    			START: begin
    				if (error)
						state = CLEAN;
    				else if ( match )
						state = MATRIX;
					else if ( repeat )
						state = REPEAT;
					else
						state = START;
    			end
    			MATRIX: begin
    				if (error)
						state = CLEAN;
    				else if ( match )
						state = FIFO_0;
					else if ( repeat )
						state = REPEAT;
					else
						state = MATRIX;
    			end
    			FIFO_0: begin
    				if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_1;
					else
						state = FIFO_GUION;
    			end
    			FIFO_1: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_2;
					else
						state = FIFO_GUION;
    			end
    			FIFO_2: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_3;
					else
						state = FIFO_GUION;
    			end
    			FIFO_3: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_4;
					else
						state = FIFO_GUION;
    			end
    			FIFO_4: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_5;
					else
						state = FIFO_GUION;
    			end
    			FIFO_5: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_6;
					else
						state = FIFO_GUION;
    			end
    			FIFO_6: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_7;
					else
						state = FIFO_GUION;
    			end
    			FIFO_7: begin
					if (error)
						state = CLEAN;
    				else if (count % n*2)
						state = FIFO_0;
					else
						state = FIFO_GUION;
    			end
    			FIFO_GUION: begin
    				if (error)
						state = CLEAN;
					else if ( count == ( ((n*2)+1)*n) )
						state = END_MATRIX;
    				else if (count % ((n*2)+1) )
						state = FIFO_0;
					else
						state = FIFO_GUION;
    			end
    			END_FIFO_M: begin
    				if (error)
						state = CLEAN;
					else if ( count == ( ((n*2)+1)*n) )
						state = END_MATRIX;
    				else if (count % ((n*2)+1) )
						state = FIFO_0;
					else
						state = FIFO_GUION;    				
    			end
    			END_MATRIX: begin
    				if (error)
						state = CLEAN;
    				else if ( match )
						state = VECTOR;
					else if ( repeat )
						state = REPEAT;
					else
						state = END_MATRIX;
    			end
    			VECTOR: begin
    				if (error)
						state = CLEAN;
    				else if ( match )
						state = FIFO_VECTOR;
					else if ( repeat )
						state = REPEAT;
					else
						state = VECTOR;
    			end
    			FIFO_VECTOR: begin
    				if (error)
						state = CLEAN;
    				else if ( match )
						state = END_VECTOR;
					else if ( repeat )
						state = REPEAT;
					else
						state = VECTOR;
    			end
    			END_VECTOR: begin
    				if (error)
						state = CLEAN;
    				else if ( match )
						state = CLEAN;
					else if ( repeat )
						state = REPEAT;
					else
						state = END_VECTOR;
    			end
    			REPEAT: begin
    				state = IDLE;
    			end
    			CLEAN: begin
    				state = IDLE;
    			end
    		endcase
    	end
    end






endmodule
`endif