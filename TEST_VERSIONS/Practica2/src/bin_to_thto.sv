/*----------------------------------------------------------------------------------------
** NOMBRE DEL MODULO: bin_to_thto.sv
** DESCRIPCION: Entra el valor completo ne binario y se divide en unidades, decenas, centenas...
** ENTRADAS: i_Bin
** SALIDAS:  o_Full_Val
** VERSION:  1.0
** AUTORES:  Andres Hernandez, Carem Bernabe
** FECHA:    17 / 03 / 19
** -------------------------------------------------------------------------------------- */

`ifndef BIN_TO_THTO_SV
    `define BIN_TO_THTO_SV
	 
module bin_to_thto
 import pkg_bin_to_thto::*;
 (
	display_if.thto	thto_if
 );

 /* cables para pasar y hacer shift de cada uno de los modulos sumadores */
 struct_thto  wires;

 /* Para iniciar se toman los valores de entrada y se recorren en cada suma */
 assign wires.full_val[0] = {'0,thto_if.o_Val_com[IVW-1:0]};

 /* Se pasan los valores con shift para sus respectivas sumas, esto para separarlos entre unidades, decenas... */
 generate 
	  genvar i;
	  for ( i = 0; i < IVW-1'b1 ; i = i + 1'b1)begin: generate_add
			add add( 
				 .i_hto_full( wires.full_val[i] << 1'b1 ), 
				 .o_hto_full( wires.full_val[i+1'b1] ) 
			);
	  end: generate_add
 endgenerate

 /* Se reparte el valor entero a sus unidades, decenas y centenas */
 assign thto_if.o_Full_Val_thto = wires.full_val[IVW-1'b1] << 1'b1;

    
endmodule

`endif