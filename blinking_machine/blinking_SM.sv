module blinking_SM(
	input        i_clk,
	input        i_rst,
	input        i_start,
	input        i_ena,

	output       o_out,
	output [2:0] o_count_ena
	);

enum logic [2:0] {IDLE, ON_1, OFF_1, ON_2, OFF_2, ON_3, OFF_3} state, next_state; 

logic l_count_ena;
logic l_out;

 always @ (posedge i_clk, posedge i_rst)begin
     state <= (i_rst)? IDLE : next_state;
 end

 always@(*)begin
 	case (state)
 		IDLE: begin
 			next_state = (i_start)? ON_1 : next_state;
 		end

 		ON_1:  begin
 			next_state = (i_ena)? OFF_1 : next_state;
 		end

 		OFF_1: begin
 			next_state = (i_ena)? ON_2  : next_state;
 		end

 		ON_2: begin
 			next_state = (i_ena)? OFF_2 : next_state;
 		end

 		OFF_2: begin
 			next_state = (i_ena)? ON_3  : next_state;
 		end

 		ON_3: begin
 			next_state = (i_ena)? OFF_3 : next_state;
 		end

 		OFF_3: begin
 			next_state = (i_ena)? IDLE  : next_state;
 		end

 		default:begin
 			next_state = IDLE;
 		end

 	endcase // state
 end

 always @ (*)begin
 	if ( state == ON_1 || state == ON_2 || state == ON_3 )begin
 		o_out = 1'b1;
 		o_count_ena = 3'b110;
 	end
 	else if ( state == OFF_1 || state == OFF_2 || state == OFF_3 )begin
 		o_out = 1'b0;
 		o_count_ena = 3'b100;
 	end
 	else begin
 		o_out = 1'b0;
 		o_count_ena = 3'b000;
 	end

 end

endmodule // blinking_SM