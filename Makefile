#TOOL INPUT
SRC =src/*.v
TESTBENCH = TestBenches/Microcontroller_tb.v
TBOUTPUT = Microcontroller_tb.vcd

#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = Scansion

#TOOL OPTIONS
COFLAGS = -v -o
SFLAGS = -v

#TOOL OUTPUT
COUTPUT = compiler.out          

###############################################################################
simulate: $(COUTPUT)
	$(SIMULATOR) $(SFLAGS) $(COUTPUT) 

display: $(TBOUTPUT)
	open -a $(VIEWER) $(TBOUTPUT) 

$(COUTPUT): $(SRC)
	$(COMPILER) $(COFLAGS) $(COUTPUT) $(TESTBENCH) $(SRC)