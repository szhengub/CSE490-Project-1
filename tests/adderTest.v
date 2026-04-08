module adderTest();

    reg [15:0] addee1;
    reg [15:0] addee2;
    wire [15:0] result;


    adder adderTest(addee1, addee2, result);

    initial begin 

        $monitor($time,,"op1: %d, op2: %d, Result: %d", addee1, addee2, result);


        #10 addee1= 10; addee2= 10; //20
        #10 addee1= 450; addee2= 35; //485     
        #10 addee1= 65535; addee2=1; //00
        #10 addee1= 1234; addee2= 0; //1234        
        #10 addee1= 0; addee2= 5678; //5678        
        #10 addee1= -16; addee2= 6; //-10
        #10 addee1= -50; addee2= -9; //-59
        #10 addee1= 0; addee2= 0; //0
        #10 addee1= 18940; addee2=2; //18942



    end


endmodule
