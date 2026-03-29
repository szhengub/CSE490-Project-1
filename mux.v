module mux (chosenPath, a, b, selector);
    input [15:0] a, b;
    input selector;

    output [15:0] chosenPath;
    reg [15:0] chosenPath;


    always @(*) begin
        if (selector == 0) begin 
            chosenPath = a;
        end
        else begin 
            chosenPath = b;
        end
    end 


endmodule


