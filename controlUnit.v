module controlUnit (opcode, funct, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite, jump, bne);
    input [3:0] opcode;
    input [3:0] funct;

    output reg branch; //are we branches? 1 for yes
    output reg memread; //are we reading memory? 1 for yes
    output reg memtoreg; //which value to write back to reg? 1 for memory, 0 for ALU 
    output reg [1:0] aluop; //different for different instructions
    output reg memwrite; //are we writing memory? 1 for yes
    output reg alusrc; // source for alu operand 2, 1 for immediate, 0 for register 2
    output reg regwrite; //are we writing back to register? 1 for yes
    output reg jump; //are we unconditional jumping? 1 for yes
    output reg bne; //differentiate between beq and bne, 1 for bne, 0 for beq

    always @(*) begin

        //maybe set some default values here?
        branch = 0;
        memread = 0;
        memtoreg = 0;
        aluop = 2'b00;
        memwrite = 0;
        alusrc = 0;
        regwrite = 0;
        jump = 0;
        bne = 0;
        
        if (opcode != 4'b0000) begin //if the opcode ISNT R-type (handle all i/j type)

            //lw
            if (opcode == 4'b0001) begin 
                branch= 0;
                memread= 1;
                memtoreg= 1;
                aluop= 2'b00;
                memwrite= 0;
                alusrc= 1;
                regwrite= 1;
                jump= 0;
                bne = 0;
            end
            //sw
            else if (opcode == 4'b0010) begin 
                branch= 0;
                memread= 0;
                memtoreg= 1; //X
                aluop= 2'b00;
                memwrite= 1;
                alusrc = 1;
                regwrite = 0;
                jump = 0;
                bne = 0;
            end
            //addi 
            else if (opcode == 4'b0011) begin 
                branch= 0;
                memread= 0;
                memtoreg= 0;
                aluop= 2'b00;
                memwrite= 0;
                alusrc= 1;
                regwrite= 1;
                jump= 0;
                bne = 0;
            end 
            //beq 
            else if (opcode == 4'b0100) begin 
                branch= 1;
                memread= 0;
                memtoreg= 0; //X
                aluop= 2'b01;
                memwrite= 0;
                alusrc= 0;
                regwrite= 0;
                jump= 0;
                bne = 0;
            end
            //bne 
            else if (opcode == 4'b0101) begin 
                branch= 1;
                memread= 0;
                memtoreg= 0; //X
                aluop= 2'b01;
                memwrite= 0;
                alusrc= 0;
                regwrite= 0;
                jump= 0;
                bne = 1;
            end 
            //jmp (0110)
            else if (opcode == 4'b0110) begin 
                branch= 0;
                memread= 0;
                memtoreg= 0; //X
                aluop= 2'b00; //X
                memwrite= 0;
                alusrc= 0; //X
                regwrite= 0;
                jump= 1;
                bne = 0;
            end  

        end
        else begin //if opcode is R-type (all R-type codes have the same variables)
            
            //add
            if(funct == 4'b0000) begin 
                branch = 0;
                memread = 0;
                memtoreg = 0;
                aluop = 2'b00;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
                jump = 0;
                bne = 0;
            end 
            //sub 
            else if (funct == 4'b0001) begin 
                branch = 0;
                memread = 0;
                memtoreg = 0;
                aluop = 2'b01;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
                jump = 0;
                bne = 0;
            end
            //sll
            else if (funct == 4'b0010) begin 
                branch = 0;
                memread = 0;
                memtoreg = 0;
                aluop = 2'b10;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
                jump = 0;
                bne = 0;
            end
            //and 
            else if (funct == 4'b0011) begin 
                branch = 0;
                memread = 0;
                memtoreg = 0;
                aluop = 2'b11;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
                jump = 0;
                bne = 0;              
            end 

        end
      

    end
   
 
endmodule
