/*----------------------------------------------------------------------------------------
* NOMBRE DEL MODULO: displays.sv
* DESCRIPCION: Entra el valor completo con las unidades divididas en secciones de 4 bits, estas secciones 
*				se pasan por  separado en el ciclo para ser instanciadas a cada display
* ENTRADAS: i_full_val
* SALIDAS:  o_7seg
* VERSION:  1.0
* AUTORES:  Andres Hernandez, Carem Bernabe
* FECHA:    17 / 03 / 19
* -------------------------------------------------------------------------------------- */

`ifndef COMPLEMENT_A2_SV
    `define COMPLEMENT_A2_SV
	 
module displays
import pkg_bin_to_thto::*;
(
	output t_display		o_7seg		/* Se pasan las salidas a displays */
	display_if.display		display_module_if
);

/* Se generan las instanciaciones para los displays necesarios  */
generate
	genvar j; 
	  for ( j = '0 ; j < 3'b100 ; j = j + 1'b1)begin: generate_7seg
		integer i = (j<<2)+IVW;
		bin_to_7seg B7S_O(
			.A(display_module_if.i_full_val[i+3]), .B(display_module_if.i_full_val[i+2]), .C(display_module_if.i_full_val[i+1]), .D(display_module_if.i_full_val[i]),
			 
			.a(o_7seg[j][0]), .b(o_7seg[j][1]), .c(o_7seg[j][2]), .d(o_7seg[j][3]), .e(o_7seg[j][4]), .f(o_7seg[j][5]), .g(o_7seg[j][6])
		);
	  end: generate_7seg
 endgenerate


endmodule

`endif


