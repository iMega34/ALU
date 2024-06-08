transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/reg_file.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/PC.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/n_bit_adder.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/MUX.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/multiplier.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/instruction_memory.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/data_memory.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/CPU.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/ALU_control.v}
vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU {D:/IntelQuartus/ALU/ALU.v}

vlog -vlog01compat -work work +incdir+D:/IntelQuartus/ALU/simulation {D:/IntelQuartus/ALU/simulation/CPU_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  CPU_tb

do D:/IntelQuartus/ALU/simulation/modelsim/init.do
