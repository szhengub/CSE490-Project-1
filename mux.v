module mux (selector, choosePath0, choosePath1, chosenPath);
    input selector;
    input [15:0] choosePath0;
    input [15:0] choosePath1;
    output reg [15:0] chosenPath;


    always @(*) begin
        if (selector == 0) begin 
            chosenPath = choosePath0;
        end
        else begin 
            chosenPath = choosePath1;
        end
    end 


endmodule


module muxOneBit (selector, choosePath0, choosePath1, chosenPath);
    input selector;
    input choosePath0;
    input choosePath1;
    output reg chosenPath;


    always @(*) begin
        if (selector == 0) begin 
            chosenPath = choosePath0;
        end
        else begin 
            chosenPath = choosePath1;
        end
    end 


endmodule
