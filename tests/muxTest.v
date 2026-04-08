module muxTest();

    //Declare inputs/outputs
    reg selector;
    reg [15:0] choose0, choose1;
    wire [15:0] chosenPath;

    mux testMux(selector, choose0, choose1, chosenPath);

    initial begin 

        $monitor($time,,"Selctor=%b, Choose0=%d, Choose1=%d, Output=%d",selector,choose0,choose1,chosenPath);

        #10 selector=0; choose0=10; choose1=55;
        #10 selector=1; choose0=10; choose1=55;
        #10 selector=0; choose0=65535; choose1=0;
        #10 selector=1; choose0=65535; choose1=0;



    end

endmodule








module muxTestOneBit();

//Declare inputs/outputs
reg selector;
reg choose0, choose1;
wire chosenPath;

muxOneBit testMux(selector, choose0, choose1, chosenPath);

initial begin 

    $monitor($time,,"Selctor=%b, Choose0=%b, Choose1=%b, Output=%b",selector,choose0,choose1,chosenPath);

    #10 selector=0; choose0=1; choose1=0;
    #10 selector=1; choose0=0; choose1=1;




end

endmodule
