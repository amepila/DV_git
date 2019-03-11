module control
import control_pkg::*;
(
	input 	i_clk,
	input 	i_rst,
	input 	i_start,

	output 	o_load,
	output 	o_ready,
	output	o_clean
);

control_t r_control;

always_ff@(posedge i_clk, negedge i_rst)begin: state_machine
	if(!i_rst)
		r_control.state <= IDLE;
	else begin
		case (r_control.state)
			IDLE:  
			begin
				if(i_start == 1'b1)
					r_control.state <= INIT;
				else 
					r_control.state <= IDLE;
			end

			INIT:  
			begin
				r_control.state <= ADD_SHIFT;
			end
					
			ADD_SHIFT: 
			begin
				if (MAX_CNTR > r_control.count)
					r_control.state <= ADD_SHIFT;
				else
					r_control.state <= IDLE;
			end
						 
			default:
				r_control.state <= IDLE;
				
		endcase 
	end
end: state_machine

always@(posedge i_clk, negedge i_rst) begin: outputs
	if(!i_rst)begin
		r_control.load 	<= 1'b0;
		r_control.ready   <= 1'b0;
		r_control.clean  	<= 1'b1;

		r_control.count 	<= '0;
	end
	else begin
 
		case (r_control.state)
			IDLE:  begin
				r_control.load   <= 1'b0;
				r_control.ready  <= 1'b1;
				r_control.clean  <= 1'b0;
				r_control.count  <= '0;
			end

			INIT:  begin
				r_control.load   <= 1'b1;
				r_control.ready  <= 1'b0;
				r_control.clean  <= 1'b1;	
			end
					
			ADD_SHIFT: begin
				r_control.ready  <= 1'b0;
				r_control.load   <= 1'b0;
				r_control.clean  <= 1'b0;

				r_control.count <= r_control.count + 1'b1;		
			end
						 
			default:begin
				r_control.load   <= 1'b0;
				r_control.ready  <= 1'b0;
				r_control.clean  <= 1'b0;
				r_control.count  <= '0;	
			end
		endcase // state	
	end
end: outputs 
 
assign  	o_load   = r_control.load;
assign	o_ready	= r_control.ready;
assign  	o_clean  = r_control.clean;

endmodule 
