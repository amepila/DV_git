onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {INPUT CTRL}
add wave -noupdate -group {Input Ctrl} /tb_ms/TOP/SM/i_clk
add wave -noupdate -group {Input Ctrl} /tb_ms/TOP/SM/i_rst
add wave -noupdate -group {Input Ctrl} /tb_ms/TOP/SM/i_start
add wave -noupdate -divider {INPUT DATA}
add wave -noupdate -radix unsigned /tb_ms/TOP/i_mltnd_val
add wave -noupdate -radix unsigned /tb_ms/TOP/i_mlter_val
add wave -noupdate -divider CTRL
add wave -noupdate -expand -group Ctrl /tb_ms/TOP/SM/i_start
add wave -noupdate -expand -group Ctrl -radix unsigned /tb_ms/TOP/SM/r_count
add wave -noupdate -expand -group Ctrl /tb_ms/TOP/SM/state
add wave -noupdate -expand -group Ctrl /tb_ms/TOP/SM/o_stop
add wave -noupdate -divider MLTR
add wave -noupdate /tb_ms/TOP/MULTIPLIER/i_load
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLIER/i_data
add wave -noupdate -radix unsigned -childformat {{{/tb_ms/TOP/MULTIPLIER/o_data[15]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[14]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[13]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[12]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[11]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[10]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[9]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[8]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[7]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[6]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[5]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[4]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[3]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[2]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[1]} -radix unsigned} {{/tb_ms/TOP/MULTIPLIER/o_data[0]} -radix unsigned}} -subitemconfig {{/tb_ms/TOP/MULTIPLIER/o_data[15]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[14]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[13]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[12]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[11]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[10]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[9]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[8]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[7]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[6]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[5]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[4]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[3]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[2]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[1]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLIER/o_data[0]} {-height 15 -radix unsigned}} /tb_ms/TOP/MULTIPLIER/o_data
add wave -noupdate /tb_ms/TOP/MULTIPLIER/o_lsb
add wave -noupdate -divider MLTD
add wave -noupdate /tb_ms/TOP/MULTIPLICAND/i_load
add wave -noupdate -radix unsigned -childformat {{{/tb_ms/TOP/MULTIPLICAND/i_data[7]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[6]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[5]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[4]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[3]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[2]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[1]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/i_data[0]} -radix unsigned}} -subitemconfig {{/tb_ms/TOP/MULTIPLICAND/i_data[7]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[6]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[5]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[4]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[3]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[2]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[1]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/i_data[0]} {-height 15 -radix unsigned}} /tb_ms/TOP/MULTIPLICAND/i_data
add wave -noupdate -radix unsigned -childformat {{{/tb_ms/TOP/MULTIPLICAND/o_data[15]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[14]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[13]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[12]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[11]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[10]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[9]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[8]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[7]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[6]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[5]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[4]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[3]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[2]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[1]} -radix unsigned} {{/tb_ms/TOP/MULTIPLICAND/o_data[0]} -radix unsigned}} -subitemconfig {{/tb_ms/TOP/MULTIPLICAND/o_data[15]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[14]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[13]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[12]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[11]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[10]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[9]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[8]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[7]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[6]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[5]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[4]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[3]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[2]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[1]} {-height 15 -radix unsigned} {/tb_ms/TOP/MULTIPLICAND/o_data[0]} {-height 15 -radix unsigned}} /tb_ms/TOP/MULTIPLICAND/o_data
add wave -noupdate -radix unsigned /tb_ms/TOP/MULTIPLICAND/r_mltnd
add wave -noupdate -divider ADD
add wave -noupdate /tb_ms/TOP/ADD/i_ena
add wave -noupdate /tb_ms/TOP/ADD/i_clean
add wave -noupdate -radix unsigned /tb_ms/TOP/ADD/i_valB
add wave -noupdate -radix unsigned /tb_ms/TOP/ADD/o_sum
add wave -noupdate -divider OUTPUT
add wave -noupdate -radix unsigned /tb_ms/TOP/o_product
add wave -noupdate /tb_ms/TOP/o_stop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {68 ps}
