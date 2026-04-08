module instructionMemTest();


    reg [15:0] pcAddress;
    wire [15:0] instruction;


    instructionMemory myTestInstrucMem(pcAddress, instruction);


    initial begin 

    $monitor($time,,"PC: %d ==> %b", pcAddress, instruction);

    #10 pcAddress= 0;
    #10 pcAddress= 2;
    #10 pcAddress= 4;
    #10 pcAddress= 6;
    #10 pcAddress= 8;
    #10 pcAddress= 10;
    #10 pcAddress= 12;
    #10 pcAddress= 14;
    #10 pcAddress= 16;
    #10 pcAddress= 18;
    #10 pcAddress= 20;
    #10 pcAddress= 22;
    #10 pcAddress= 24;
    #10pcAddress= 26;





    end


endmodule
