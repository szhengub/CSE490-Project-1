module instructionMemory(pcAddress, instruction);

    input [15:0] pcAddress;
    output [15:0] instruction;

    //64 Byte memory is the minimum
    reg [15:0] memory [0:31];
    integer i;

    initial begin 

        //clear the instructions


        for (i=0; i<32; i=i+1) begin 
            memory[i] = 16'b0;
        end 



        //hardcode the instructions

        //add  
        //0000-s10-s11-0000
        //100+64
        memory[0] = 16'b0000_1010_1011_0000; 

        //sub 
        //0000-s2-s6-0001
        //10-2
        memory[1] = 16'b0000_0010_0110_0001; 

        //sll
        //0000-s8-s1-0010 
        //shifts 25 by 1 bit
        memory[2] = 16'b0000_1000_0001_0010 ;

        //and
        //0000-s11-s1-0011
        // 1 AND 100
        memory[3] = 16'b0000_1011_0001_0011;

        //lw
        //0001-s14-s3-0010
        //loads value into s14
        memory[4] = 16'b0001_1110_0011_0011;

        //sw
        //0010-s3-s13-0100
        //stores s13 (1000) into memory
        memory[5] = 16'b0010_0011_1101_0100;

        //addi
        //0011-s9-s5-0111
        // 8 + imm(7) 
        memory[6] = 16'b0011_1001_0101_0111;

        //beq (not taken)
        //0100-s6-s7-0001
        memory[7] = 16'b0100_0110_0111_0001;

        //beq (taken)
        //0100-s6-s6-0001
        memory[8] = 16'b0100_0110_0110_0001;

        //bne (not taken)
        //0101-s6-s6-0001
        memory[9] = 16'b0101_0110_0110_0001;

        //bne (taken)
        //0101-s6-s7-0001
        memory[10] = 16'b0101_0110_0111_0001;

        //jmp
        //0110-000011111000
        memory[11] = 16'b0110_000011111000;

    end


    assign instruction= memory[pcAddress >> 1];



endmodule
