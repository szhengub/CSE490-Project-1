module pcTester();

    reg clock;
    reg reset;
    reg [15:0] pcPlusTwo;
    wire [15:0] currentPc;


    pc myTestPc(clock, reset, pcPlusTwo, currentPc);


    initial begin 

        $monitor($time,,"clock:  %b; reset:  %b; pcPlusTwo:  %b; currentPc:   %b;", clock, reset, pcPlusTwo, currentPc);

        //init 
        clock = 0; reset = 1; pcPlusTwo = 0;
        
        //clock cycle
        #5 clock = 1; //current PC clears upon clock uptic
        #5 clock = 0; reset = 0; pcPlusTwo = 2; 
        
        // get next instruction
        #5 clock = 1; //current PC will be 2 upon uptic
        #5 clock = 0; pcPlusTwo = 50; 

        // jump to new place 
        #5 clock = 1; //current PC will be 50 upon clock uptic
        #5 clock = 0; reset = 1; pcPlusTwo = 52; 

        // reset again 
        #5 clock = 1; //current PC will be cleared upon clock uptic 
        #5 clock = 0;



    end



endmodule
