
module TopModuleHW8(
		input[31:0] instruction,
		input[3:0] flag,
		output reg [1:0] op,
		output reg [3:0] comand,
		output reg [23:0] immadiateInst,
		output reg [3:0] baseAddr,
		output reg [3:0] dataRegister,
		output reg [11:0] memoryimm,
		output reg jmpEnable,
		output reg regjmpEnable,
		output reg flagEnable,
		output reg datawriteEnable,
		output reg datamemory,	
		output reg datamemoryEnable
    );
	 
	 always @(*) begin
		op=instruction[27:26];
		comand=instruction[24:21];
		
		if(op==2'b00) begin //data procesing
			jmpEnable=0;
			immadiateInst=0;
			baseAddr = instruction[19:16];
			dataRegister = instruction[15:12];
			regjmpEnable=0;
			datamemory=0;
			datamemoryEnable = 0;
			memoryimm=0;
			flagEnable = instruction[20]==1? 1:0;
			datawriteEnable = comand==10? 0:1;
			

		end
		
		if(op==2'b01) begin 
			jmpEnable=0;
			regjmpEnable=0;
			immadiateInst=0;
			flagEnable=0;
			datawriteEnable=0;
			baseAddr = instruction[19:16];
			dataRegister = instruction[15:12];
			datamemoryEnable = 1;
			if(instruction[20]==1)begin
				datamemory=1;
				datamemoryEnable=1;
			end
			else begin
				datamemory=0;
				datamemoryEnable=0;
			end
			
			
			memoryimm = instruction[25]==1 ? instruction[11:0]:0;
		end
		
		if(op==2'b10) begin 
			jmpEnable=1;
			regjmpEnable=1;
			immadiateInst=instruction[23:0];
			flagEnable=0;
			datawriteEnable=0;
			baseAddr=0;
			dataRegister=0;
			datamemory=0;
			memoryimm=0;
			datamemory=0;
			datamemoryEnable=0;
		end
	 end


endmodule
