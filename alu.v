module alu( reg1, reg2, op, result, zero );
    input [15:0] reg1; //first operand
    input [15:0] reg2; //second operand
    input [1:0] op; //alu op code to control the operation 

    output reg [15:0] result; //alu result 
    output reg zero; //the zero bit which helps with conditional branching


    always @(*) begin 
        case(op)
            //add (00) 
            2'b00: result = reg1+reg2;
            //sub (01) 
            2'b01: result = reg1-reg2;
            //shift left (10)
            2'b10: result = reg2<<reg1;
            //and (11) 
            2'b11: result = reg1&reg2;
        endcase

        if(result == 0) begin 
            zero =1;
        end else begin 
            zero =0;
        end 


    end



endmodule





