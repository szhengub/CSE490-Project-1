module pc(clock, reset, pcPlusTwo, currentPc);
    input clock; //is the clock for the pc (1 is up tic, 0 is down tic)
    input reset; //are we resetting the circuit? (1==yes, 0==no)
    input [15:0] pcPlusTwo; //the PC which we calculated in the prev cycle
    output reg [15:0] currentPc; //the pc which we'll use in the next cycle

    //updates the pc upon every clock tic
    always @(posedge clock) begin 
        if (reset == 1) begin 
            //the circuit reset, set the pc to 0
            currentPc <= 0;
        end else begin 
            //no reset happened, continue the circuit running as normal
            currentPc <= pcPlusTwo; //the PC+2 we calculated in the prev cycle is fed into instruction mem for this cycle
        end 
    end 

endmodule



