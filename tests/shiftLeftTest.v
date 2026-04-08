module shiftLeftTest();

    reg [15:0] operand;
    wire [15:0] shiftResult;


    shiftLeft myTestShift(operand, shiftResult);



    initial begin 
        $monitor($time,,"%d ==> %d", operand, shiftResult);


        #10 operand= 10; 
        #10 operand= 1;
        #10 operand= 0;
        #10 operand= 16'b1000000000000000;
        #10 operand= 22;
        #10 operand= 100;
        #10 operand= 90;
        #10 operand= 16'b1010101010101010;





    end



endmodule
