module dataMemory(clock, memWrite, memRead, address, dataToWrite, readData);
    input clock;            //Clock
    input memWrite;         //(Control bit) Are we writing to memory?
    input memRead;          //(Control bit) Are we reading from memory?
    input [15:0] address;   //(From Alu Result) Address
    input [15:0] dataToWrite; //(From Reg2, rt/rd) Data to write to memory

    output reg [15:0] readData; //Data read from memory (goes to reg's write data input)


    //init memory (64 bytes min) 
    reg [15:0] memory [0:31];
    integer i;

    //init memory 
    initial begin 

    //im making all the mem cleared out here
    //we can hardcode values or write some with sw later
    for(i=0; i<32; i=i+1) begin 
        memory[i]=16'b0;
    end

    //hardcode some stuff
    memory[0]=99;
    memory[1]=342;
    memory[2]=1;
    memory[3]=100;
    memory[4]=876;
    memory[5]=4;
    memory[6]=9876;
    memory[7]=345;
    memory[8]=793;
    memory[9]=25;
    memory[10]=15;
    memory[11]=64;
    memory[12]=8;
    memory[13]=3000;
    memory[14]=30999;
    memory[15]=12;
    end 

    //read 
    always @(*) begin 
        if(memRead==1) begin 
            readData= memory[address];
        end 

    end 


    //write 
    always @(posedge clock) begin 
        if (memWrite==1) begin 

            memory[address] <= dataToWrite;


        end 



    end 





endmodule



