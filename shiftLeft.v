module shiftLeft(operand, shiftResult);
    input [15:0] operand;
    output [15:0] shiftResult;

    assign shiftResult= operand<<<1;



endmodule
