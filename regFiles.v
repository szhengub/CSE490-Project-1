module registers(clock, regWrite, readReg1, readReg2, dataToWrite, regData1, regData2);

    input clock;
    input regWrite; //(Control Unit) are we writing to register?
    input [3:0] readReg1; //rs
    input [3:0] readReg2; //rt/rd (also to be written to)
    input [15:0] dataToWrite; //Data calculated by ALU/instruction memory

    output reg [15:0] regData1;
    output reg [15:0] regData2;





    //Declare 16 registers
    reg [15:0] s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15;





    //hardcode the register values
    initial begin

        s0=0;
        s1=1;
        s2=2;
        s3=3;
        s4=4;
        s5=8;
        s6=10;
        s7=16;
        s8=25;
        s9=32;
        s10=64;
        s11=100;
        s12=500;
        s13=1000;
        s14=2000;
        s15=-1;

    end



    //read register contents
    always @(*) begin

        case(readReg1)  

            0: regData1=s0;
            1: regData1=s1;
            2: regData1=s2;
            3: regData1=s3;
            4: regData1=s4;
            5: regData1=s5;
            6: regData1=s6;
            7: regData1=s7;
            8: regData1=s8;
            9: regData1=s9;
            10: regData1=s10;
            11: regData1=s11;
            12: regData1=s12;
            13: regData1=s13;
            14: regData1=s14;
            15: regData1=s15;

        endcase



        case(readReg2)  

            0: regData2=s0;
            1: regData2=s1;
            2: regData2=s2;
            3: regData2=s3;
            4: regData2=s4;
            5: regData2=s5;
            6: regData2=s6;
            7: regData2=s7;
            8: regData2=s8;
            9: regData2=s9;
            10: regData2=s10;
            11: regData2=s11;
            12: regData2=s12;
            13: regData2=s13;
            14: regData2=s14;
            15: regData2=s15;

        endcase





    end




    //Writeback Register
    always @(posedge clock) begin

        //only write if thats what we're doing
        if (regWrite == 1) begin

            case(readReg2)  
                0: s0 <= dataToWrite;
                1: s1 <= dataToWrite;
                2: s2 <= dataToWrite;
                3: s3 <= dataToWrite;
                4: s4 <= dataToWrite;
                5: s5 <= dataToWrite;
                6: s6 <= dataToWrite;
                7: s7 <= dataToWrite;
                8: s8 <= dataToWrite;
                9: s9 <= dataToWrite;
                10: s10 <= dataToWrite;
                11: s11 <= dataToWrite;
                12: s12 <= dataToWrite;
                13: s13 <= dataToWrite;
                14: s14 <= dataToWrite;
                15: s15 <= dataToWrite;
            endcase


        end





    end









endmodule
