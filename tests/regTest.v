

module regTestReading();

    reg clock;
    reg regWrite; //(Control Unit) are we writing to register?
    reg [3:0] readReg1; //rs
    reg [3:0] readReg2; //rt/rd (also to be written to)
    reg [15:0] dataToWrite; //Data calculated by ALU/instruction memory

    wire [15:0] regData1;
    wire [15:0] regData2;



    registers myTestReg(clock, regWrite, readReg1, readReg2, dataToWrite, regData1, regData2);

    initial begin 

        readReg1= 1; readReg2= 15;
        #10; $display("Read Data 1 (1): %d, Read Data 2 (-1): %d", regData1, regData2);
        readReg1= 2; readReg2= 14;
        #10; $display("Read Data 1 (2): %d, Read Data 2 (2000): %d", regData1, regData2);
        readReg1= 3; readReg2= 13;
        #10; $display("Read Data 1 (3): %d, Read Data 2 (1000): %d", regData1, regData2);
        readReg1= 4; readReg2= 12;
        #10; $display("Read Data 1 (4): %d, Read Data 2 (500): %d", regData1, regData2);
        readReg1= 5; readReg2= 11;
        #10; $display("Read Data 1 (8): %d, Read Data 2 (100): %d", regData1, regData2);
        readReg1= 6; readReg2= 10;
        #10; $display("Read Data 1 (10): %d, Read Data 2 (64): %d", regData1, regData2);
        readReg1= 7; readReg2= 9;
        #10; $display("Read Data 1 (16): %d, Read Data 2 (32): %d", regData1, regData2);
        readReg1= 0; readReg2= 8;
        #10; $display("Read Data 1 (0): %d, Read Data 2 (25): %d", regData1, regData2);
        #10;
    end

endmodule





module regTestWriting();

    reg clock;
    reg regWrite; //(Control Unit) are we writing to register?
    reg [3:0] readReg1; //rs
    reg [3:0] readReg2; //rt/rd (also to be written to)
    reg [15:0] dataToWrite; //Data calculated by ALU/instruction memory

    wire [15:0] regData1;
    wire [15:0] regData2;



    registers myTestReg(clock, regWrite, readReg1, readReg2, dataToWrite, regData1, regData2);

    initial begin 
        clock=0;
        regWrite=0;
        readReg1 = 0;
        readReg2 = 0;
        dataToWrite = 100;

        #5; 
        
        $display("Data in rt/rd before trying to write: %d", regData2 );

        #5 clock=1;
        $display("Data in rt/rd: %d (should be 0)", regData2 );

        #5 clock=0; regWrite=1;

        $display("Data in rt/rd before trying to write: %d", regData2 );

        #5 clock=1;
        #5; clock=0;
        $display("Data in rt/rd: %d (should be 100)", regData2 );

        #5;



    end

endmodule
