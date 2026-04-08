module immediateSignTest();


    reg [3:0] imm;
    wire [15:0] immResult;

    immediateSignExtender myTestImm(imm, immResult);


    initial begin 
        $monitor($time,, "%b ==> %b", imm, immResult);

        #10 imm= 4'b0001;
        #10 imm= 4'b1010;
        #10 imm= 4'b1111;
        #10 imm= 4'b0111;
        #10 imm= 4'b1000;
        #10 imm= 4'b0000;


    end


endmodule













module jumpSignTest();

    reg [11:0] imm;
    wire [15:0] immResult;


    jumpSignExtender myTestJumpExtend(imm, immResult);


    initial begin 
        $monitor($time,,"%b ==> %b", imm, immResult);


        #10 imm= 12'b000000000000;
        #10 imm= 12'b111111111111;
        #10 imm= 12'b011111111111;
        #10 imm= 12'b100000000000;
        #10 imm= 12'b101010101010;
        #10 imm= 12'b010101010101;






    end 


endmodule





















