module adder(operand1, operand2, adderResult);

    input [15:0] operand1;
    input [15:0] operand2;
    output [15:0] adderResult;

    assign adderResult= operand1 + operand2;


endmodule
