* CMOS Inverter Simulation Testbench
* 1. Load the Library with the Correct Corner
.lib "/home/aqil/.volare/volare/sky130/versions/c6d73a35f524070e85faff4a6a9eef49553ebc2b/sky130A/libs.tech/ngspice/sky130.lib.spice" tt

* 2. Include your reconstructed layout math
.include INVERTER_extracted.cir

* 3. Power Supplies
Vdd VDD 0 1.8
Vss VSS 0 0

* 4. Input Signal
* Starts at 0, 1ns delay, 100ps rise/fall, 4ns pulse width, 10ns period
Vin IN VSS PULSE(0 1.8 1n 100p 100p 4n 10n)

* 5. The Subcircuit Call
X1 VDD VSS IN OUT INVERTER

* 6. Simulation Settings
.tran 0.01n 20n

* 7. The Control Block
.control
  run
  set color0=white
  set color1=black
  plot v(IN) v(OUT)
.endc
.end
