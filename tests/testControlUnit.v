module testControlUnit();
    reg [3:0] opcode;
    reg [3:0] funct;

    wire branch; //are we branches? 1 for yes
    wire memread; //are we reading memory? 1 for yes
    wire memtoreg; //which value to write back to reg? 1 for memory, 0 for ALU 
    wire [1:0] aluop; //different for different instructions
    wire memwrite; //are we writing memory? 1 for yes
    wire alusrc; // source for alu operand 2, 1 for immediate, 0 for register 2
    wire regwrite; //are we writing back to register? 1 for yes
    wire jump; //are we unconditional jumping? 1 for yes
    wire bne; //differentiate between beq and bne, 1 for bne, 0 for beq


    controlUnit myTestControlUnit(opcode, funct, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite, jump, bne);


    initial begin 
        $monitor($time,,"opcode: %b, funct: %b, %b-%b-%b-%b-%b-%b-%b-%b-%b", opcode, funct, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite, jump, bne);

        //add 
        #10 opcode= 4'b0000; funct= 4'b0000;
        //sub
        #10 opcode= 4'b0000; funct= 4'b0001;
        //sll
        #10 opcode= 4'b0000; funct= 4'b0010;
        //and
        #10 opcode= 4'b0000; funct= 4'b0011;
        //lw
        #10 opcode= 4'b0001; funct= 4'b1111;        
        //sw
        #10 opcode= 4'b0010; funct= 4'b1111; 
        //addi
        #10 opcode= 4'b0011; funct= 4'b1111; 
        //beq
        #10 opcode= 4'b0100; funct= 4'b1111; 
        //bne
        #10 opcode= 4'b0101; funct= 4'b1111; 
        //jmp
        #10 opcode= 4'b0110; funct= 4'b1111; 




    end




endmodule
