module instructionMemory(pcAddress, instruction);

    input [15:0] pcAddress;
    output [15:0] instruction;

    //The Instruction Memory has a minimum size of 64 memory locations.
    reg [15:0] memory [0:31];

    initial begin 

        //clear the instructions
        integer i;

        for (i=0; i<32; i=i+1) begin 
            memory[i] = 16'b0;
        end 



        //hardcode the instructions

        //add (as an example)
        memory[0] = 16'b0000000100100000; //add s1, s2


    end


    assign instruction= memory[pcAddress >> 1];



endmodule
