///////////////////////

module HW8Test;

	// Inputs
	reg [31:0] instruction;
	reg [3:0] flag;

	// Outputs
	wire [1:0] op;
	wire [3:0] comand;
	wire [23:0] immadiateInst;
	wire [3:0] baseAddr;
	wire [3:0] dataRegister;
	wire [11:0] memoryimm;
	wire jmpEnable;
	wire regjmpEnable;
	wire flagEnable;
	wire datawriteEnable;
	wire datamemory;
	wire datamemoryEnable;

	// Instantiate the Unit Under Test (UUT)
	TopModuleHW8 uut (
		.instruction(instruction), 
		.flag(flag), 
		.op(op), 
		.comand(comand), 
		.immadiateInst(immadiateInst), 
		.baseAddr(baseAddr), 
		.dataRegister(dataRegister), 
		.memoryimm(memoryimm), 
		.jmpEnable(jmpEnable), 
		.regjmpEnable(regjmpEnable), 
		.flagEnable(flagEnable), 
		.datawriteEnable(datawriteEnable), 
		.datamemory(datamemory), 
		.datamemoryEnable(datamemoryEnable)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;
		flag = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
      instruction = 32'b11010011011100010110101011111111;
		// Add stimulus here
		#100;
      instruction = 32'b00010111011100010000101011101111;
		
		#100;
      instruction = 32'b11011011011100010110101011100011;

	end
      
endmodule

