onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /CPU_tb/dut/PC/clk
add wave -noupdate -radix unsigned /CPU_tb/dut/PC/reset
add wave -noupdate -radix unsigned /CPU_tb/dut/NextPC/from_pc
add wave -noupdate -radix unsigned /CPU_tb/dut/NextPC/next_to_pc
add wave -noupdate -radix unsigned /CPU_tb/dut/PC/pc_input
add wave -noupdate -radix unsigned /CPU_tb/dut/PC/pc_output
add wave -noupdate -radix unsigned /CPU_tb/dut/InstructionMemory/read_address
add wave -noupdate -radix binary /CPU_tb/dut/InstructionMemory/instruction
add wave -noupdate -radix unsigned /CPU_tb/dut/RegisterFile/write_enable
add wave -noupdate -radix unsigned /CPU_tb/dut/RegisterFile/reg_src1
add wave -noupdate -radix unsigned /CPU_tb/dut/RegisterFile/reg_src2
add wave -noupdate -radix unsigned /CPU_tb/dut/RegisterFile/reg_dest
add wave -noupdate -radix unsigned /CPU_tb/dut/RegisterFile/data_input
add wave -noupdate -radix decimal /CPU_tb/dut/RegisterFile/read_data1
add wave -noupdate -radix decimal /CPU_tb/dut/RegisterFile/read_data2
add wave -noupdate -radix decimal /CPU_tb/dut/ALU/a
add wave -noupdate -radix decimal /CPU_tb/dut/ALU/b
add wave -noupdate -radix binary /CPU_tb/dut/ALU/opcode
add wave -noupdate -radix decimal /CPU_tb/dut/ALU/result
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/negative
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/zero
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/carry
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/overflow
add wave -noupdate -radix decimal /CPU_tb/dut/ALU/add_result
add wave -noupdate -radix decimal -childformat {{{/CPU_tb/dut/ALU/sub_result[31]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[30]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[29]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[28]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[27]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[26]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[25]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[24]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[23]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[22]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[21]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[20]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[19]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[18]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[17]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[16]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[15]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[14]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[13]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[12]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[11]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[10]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[9]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[8]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[7]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[6]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[5]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[4]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[3]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[2]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[1]} -radix decimal} {{/CPU_tb/dut/ALU/sub_result[0]} -radix decimal}} -subitemconfig {{/CPU_tb/dut/ALU/sub_result[31]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[30]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[29]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[28]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[27]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[26]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[25]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[24]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[23]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[22]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[21]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[20]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[19]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[18]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[17]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[16]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[15]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[14]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[13]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[12]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[11]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[10]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[9]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[8]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[7]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[6]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[5]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[4]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[3]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[2]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[1]} {-radix decimal} {/CPU_tb/dut/ALU/sub_result[0]} {-radix decimal}} /CPU_tb/dut/ALU/sub_result
add wave -noupdate -radix decimal /CPU_tb/dut/ALU/mul_result
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/add_carry
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/sub_carry
add wave -noupdate -radix unsigned /CPU_tb/dut/ALU/sub_cary
add wave -noupdate -radix binary /CPU_tb/dut/ALUControl/alu_opcode
add wave -noupdate -radix unsigned /CPU_tb/dut/ALUControl/func7
add wave -noupdate -radix unsigned /CPU_tb/dut/ALUControl/func3
add wave -noupdate -radix binary /CPU_tb/dut/ALUControl/alu_control
add wave -noupdate -radix unsigned /CPU_tb/dut/DataMemory/mem_read
add wave -noupdate -radix unsigned /CPU_tb/dut/DataMemory/mem_write
add wave -noupdate -radix unsigned /CPU_tb/dut/DataMemory/address
add wave -noupdate -radix unsigned /CPU_tb/dut/DataMemory/data_input
add wave -noupdate -radix unsigned /CPU_tb/dut/DataMemory/data_output
add wave -noupdate -radix unsigned /CPU_tb/dut/MUX2/select
add wave -noupdate -radix decimal /CPU_tb/dut/MUX2/a
add wave -noupdate -radix decimal /CPU_tb/dut/MUX2/b
add wave -noupdate -radix decimal /CPU_tb/dut/MUX2/mux_output
add wave -noupdate -radix binary /CPU_tb/dut/ControlUnit/opcode
add wave -noupdate -radix unsigned /CPU_tb/dut/ControlUnit/branch
add wave -noupdate -radix unsigned /CPU_tb/dut/ControlUnit/memory_read
add wave -noupdate -radix unsigned /CPU_tb/dut/ControlUnit/memory_to_register
add wave -noupdate -radix unsigned /CPU_tb/dut/ControlUnit/memory_write
add wave -noupdate -radix unsigned /CPU_tb/dut/ControlUnit/alu_src
add wave -noupdate -radix unsigned /CPU_tb/dut/ControlUnit/reg_write
add wave -noupdate -radix binary /CPU_tb/dut/ControlUnit/alu_opcode
add wave -noupdate -radix unsigned {/CPU_tb/dut/RegisterFile/registers[0]}
add wave -noupdate -radix unsigned {/CPU_tb/dut/RegisterFile/registers[1]}
add wave -noupdate -radix unsigned {/CPU_tb/dut/RegisterFile/registers[2]}
add wave -noupdate -radix unsigned {/CPU_tb/dut/RegisterFile/registers[3]}
add wave -noupdate -radix unsigned {/CPU_tb/dut/DataMemory/memory[0]}
add wave -noupdate -radix unsigned {/CPU_tb/dut/DataMemory/memory[1]}
add wave -noupdate -radix unsigned {/CPU_tb/dut/DataMemory/memory[2]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {382 ps} 0}
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
WaveRestoreZoom {100 ps} {1100 ps}
