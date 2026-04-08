module aluTest();

    reg [15:0] reg1;
    reg [15:0] reg2;
    reg [1:0] op;

    wire [15:0] result;
    wire zero;


    alu myTestAlu(reg1, reg2, op, result, zero);


    initial begin 


        $monitor($time,,"reg1: %d, reg2: %d, op: %b, Result: %d, Zero: %d", reg1, reg2, op, result, zero);


        //add (00) 
        #10 reg1= 0; reg2=16; op= 2'b00; //16
        #10 reg1= 88; reg2=12; op=2'b00; //100
        #10 reg1= 55; reg2=45; op=2'b00; //100
        #10 reg1= 334455; reg2=1; op=2'b00; //334456
        #10 reg1= 10; reg2= -1; op=2'b00; //9
        #10 reg1= 0; reg2= 0; op=2'b00; //0


        //sub (01) 
        #10 reg1= 10; reg2=10; op=2'b01; //0
        #10 reg1= 99; reg2=9; op=2'b01; //90
        #10 reg1= 7890; reg2=1; op=2'b01; //7889
        #10 reg1= 10; reg2=-10; op=2'b01; //20
        #10 reg1= -45; reg2=-5; op=2'b01; //-40

        //shift left (10)
        #10 reg1= 1; reg2=10; op=2'b10; //20 
        #10 reg1= 2; reg2=10; op=2'b10; //20 
        #10 reg1= 16; reg2= 1; op=2'b10; //0


        //and (11) 
        #10 reg1= 16'hffff; reg2= 16'hffff; op=2'b11; //ffff
        #10 reg1= 0; reg2= 16'hffff; op=2'b11; //0
        #10 reg1 = 16'h5555; reg2 = 16'hAAAA; op=2'b11;//0
        #10 reg1 = 16'h8000; reg2 = 16'h8000; op=2'b11;//0x8000
        #10 reg1 = 16'h000F; reg2 = 16'h0007; op=2'b11;// 7 
















    end



endmodule
