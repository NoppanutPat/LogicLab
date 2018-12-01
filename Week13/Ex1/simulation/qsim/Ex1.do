onerror {exit -code 1}
vlib work
vlog -work work Ex1.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L fiftyfivenm_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Ex1_vlg_vec_tst -voptargs="+acc"
vcd file -direction Ex1.msim.vcd
vcd add -internal Ex1_vlg_vec_tst/*
vcd add -internal Ex1_vlg_vec_tst/i1/*
run -all
quit -f
