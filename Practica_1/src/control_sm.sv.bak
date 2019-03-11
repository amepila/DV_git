module control#(
	parameter BW = 8,
	parameter DW = $clog2(BW)
	)(
	input 	i_clk,
	input 	i_rst,
	input 	i_start,

	output 	o_load,
	output 	o_stop,
	output  o_clean
	);

	enum logic [2:0] {IDLE, INIT, ADD_SHIFT} state; 

	logic 	r_load;
	logic 	r_stop;
	logic   r_clean;

	logic [DW:0]  r_count = '0;

	always_ff@(posedge i_clk, negedge i_rst)begin

		if(!i_rst)
			state <= IDLE;
		else begin
		 
			case (state)
				IDLE:  begin
					if(i_start == 1'b1)
						state <= INIT;
					else 
						state <= IDLE;
				end

				INIT:  begin
					state <= ADD_SHIFT;
				end
						
				ADD_SHIFT: begin
					if (BW - 1'b1 > r_count)
						state <= ADD_SHIFT;
					else
						state <= IDLE;
				end
							 
				default:
					state <= IDLE;

			endcase 
		end
	 end

	 always@(posedge i_clk, negedge i_rst) begin
		if(!i_rst)begin
			r_load   = 1'b0;
			r_stop   = 1'b0;
			r_clean  = 1'b1;

			r_count = '0;
		end
		else begin
	 
			case (state)
				IDLE:  begin
				    r_load   = 1'b0;
					r_stop   = 1'b1;
					r_clean  = 1'b0;
					r_count  = '0;
				end

				INIT:  begin
					r_load   = 1'b1;
					r_stop   = 1'b0;
					r_clean  = 1'b1;	
				end
						
				ADD_SHIFT: begin
					r_stop   = 1'b0;
					r_load   = 1'b0;
					r_clean  = 1'b0;

					r_count = r_count + 1'b1;		
				end
							 
				default:begin
					r_load   = 1'b0;
					r_stop   = 1'b0;
					r_clean  = 1'b0;	
				end
			endcase // state	
		end
	 end
	 
	assign  o_load   = r_load;
	assign	o_stop	 = r_stop;
	assign  o_clean  = r_clean;

endmodule 
