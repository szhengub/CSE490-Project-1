module immediateSignExtender(imm, extendedImm);
    //entends a 4 bit immediate value into 16 bits 

    input [3:0] imm;
    output [15:0] extendedImm;


    //takes MSB of immediate and replicates it 12 times
    //then concats it with the original immediate
    assign extendedImm= { {12{imm[3]}}, imm};


endmodule

module jumpSignExtender(imm, extendedImm);
    //entends a 4 bit immediate value into 16 bits 

    input [11:0] imm;
    output [15:0] extendedImm;


    //takes MSB of immediate and replicates it 12 times
    //then concats it with the original immediate
    assign extendedImm= { {4{imm[11]}}, imm};


endmodule
