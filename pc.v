module pc(clock, oldPc, reset, newPc);
    input clock; //is the clock for the pc (1 is up tic, 0 is down tic)
    input [15:0] oldPc; //the PC which we calculated in the prev cycle
    input reset; //are we resetting the circuit? (1==yes, 0==no)
    output reg [15:0] newPc; //the pc which we'll use in the next cycle

    //updates the pc upon every clock tic
    always @(posedge clock) begin 
        if (reset == 1) begin 
            //the circuit reset, set the pc to 0
            newPc <= 0;
        end else begin 
            //no reset happened, continue the circuit running as normal
            newPc <= oldPc; //the old Pc we calculated is the current Pc we're using 
        end 
    end 

endmodule



