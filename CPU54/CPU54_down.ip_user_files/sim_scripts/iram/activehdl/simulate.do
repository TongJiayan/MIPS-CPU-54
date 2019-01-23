onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+iram -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_10 -O5 xil_defaultlib.iram xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {iram.udo}

run -all

endsim

quit -force
