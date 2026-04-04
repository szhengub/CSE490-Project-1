module datapath(clock, reset);

    input clock, reset; //inputs to the entire circuit 

    wire [15:0] pcPlusTwo;
    wire [15:0] pcOutput;
    wire [15:0] instruction;
    wire branch;
    wire memread;
    wire memtoreg;
    wire [1:0] aluop;
    wire memwrite;
    wire alusrc;
    wire regwrite;
    wire jump;
    wire bne;
    wire [15:0] dataRegWriteback;
    wire [15:0] readData1;
    wire [15:0] readData2;
    wire [15:0] immediate;
    wire [15:0] chosenAluOp;
    wire [15:0] aluResult;
    wire zeroBit;
    wire [15:0] dataFromMemory;
    wire invertedZero;
    wire andGateInput; 
    wire andResult;
    wire [15:0] shiftedImmediate;
    wire [15:0] incrementedPc;
    wire [15:0] extendedJump;
    wire [15:0] shiftedJump;
    wire [15:0] finalJumpAddress;
    wire [15:0] finalBranchAddress;
    wire [15:0] pcOrBranch;





    //////////////////////////////
    ////////Program Counter/////// 
    //////////////////////////////
        //input: clock [1]
        //input: reset [1]
        //input:pcPlusTwo [16]          //we calculated in prev instruction
        //output: currentPc [16]        //pc we're currently using to pass on 
    pc mypc(clock, reset, pcPlusTwo, pcOutput); 
        //pcOutput [16] (has current PC counter)



    //////////////////////////////
    //////Instruction Memory//////
    //////TEMPORARY VALUES////////
    //////////////////////////////
        //input: pcAddress [16]
        //output: instruction [16]
    instructionMemory myInMem(pcOutput, instruction);
        //instruction [16] (is current instruction)



    //////////////////////////////
    ////////Control Unit//////////
    //////////////////////////////
        //input: opcode [4]
        //input: funct [4]
        //output: branch [1]
        //output: memread [1]
        //output: memtoreg [1]
        //output: aluop [2]
        //output: memwrite [1]
        //output: alusrc [1]
        //output: regwrite [1]
        //output: jump [1]
        //output: bne [1]
    controlUnit myConUnit(instruction[15:12], instruction[3:0], branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite, jump, bne);
        //branch [1]
        //memread [1]
        //memtoreg [1]
        //aluop [1]
        //memwrite [1]
        //alusrc [1]
        //regwrite [1]
        //jump [1]
        //bne [1]




    //////////////////////////////
    ////////Register File//////////
    //////TEMPORARY VALUES////////
    //////////////////////////////
        //input: clock [1]
        //input: reset [1]
        //input: regwrite [1]
        //input: readReg1 [4] (rs) 
        //input: readReg2 [4] (rt/rd) 
        //input: regToWrite [4] (rt/rd) 
        //input: dataToWrite [16]
        //output: regData1 [16]
        //output: regData2 [16]
    registers myReg(clock, reset, regwrite, instruction[7:4], instruction[11:8], instruction[11:8], dataRegWriteback, readData1, readData2);
        //readData1 [16]
        //readData2 [16]

    
    /////////////////////////////////////////
    ////////Immediate Sign Extender//////////
    ////////////////////////////////////////
        //input: imm [4]
        //output: extendedImm [16]
    immediateSignExtender myImmSignExtend(instruction[3:0], immediate);
        //immediate [16]


    /////////////////////////////////////////
    ////////////MUX 1 (AluSrc)///////////////
    ////////////////////////////////////////
        //input: selector [1]
        //input: choosePath0 [16]
        //input: choosePath1 [16]
        //output: chosenPath [16]
    mux myMux1(alusrc, readData2, immediate, chosenAluOp);
        //chosenAluOp [16]
    



    /////////////////////////////////////////
    ///////////////////ALU//////////////////
    ////////////////////////////////////////
        //input: reg1 [16]
        //input: reg2 [16]
        //input: op [2]
        //output: result [16]
        //output: zero [1]
    alu myAlu(readData1, chosenAluOp, aluop, aluResult, zeroBit);
        //aluResult [16]
        //zeroBit [1]




    //////////////////////////////
    /////////Data Memory//////////
    //////TEMPORARY VALUES////////
    //////////////////////////////
        //input: clock [1]
        //input: memWrite [1]
        //input: memRead [1]
        //input: address [16]
        //input: dataToWrite [16]
        //output: readData [16]
    dataMemory myDataMem(clock, memwrite, memread, aluResult, readData2, dataFromMemory);
        //dataFromMemory [16]



    /////////////////////////////////////////
    ////////////MUX 2 (MemtoReg)///////////////
    ////////////////////////////////////////
        //input: selector [1]
        //input: choosePath0 [16]
        //input: choosePath1 [16]
        //output: chosenPath [16]
    mux myMux2(memtoreg, aluResult, dataFromMemory, dataRegWriteback);
        //dataRegWriteback [16]



    /////////////////////////////////////////
    ///////////////////Not//////////////////
    ////////////////////////////////////////
        //output: not [1]
        //input: data [1]
    not myNot(invertedZero, zeroBit);
        //invertedZero



    /////////////////////////////////////////
    //////////////MUX 3 (bne)////////////////
    /////////////////////////////////////////
        //input: selector [1]
        //input: choosePath0 [1]
        //input: choosePath1 [1]
        //output: chosenPath [1]
    muxOneBit myMux3 (bne, zeroBit, invertedZero, andGateInput);
        //andGateInput [1]



    /////////////////////////////////////////
    ///////////////////And//////////////////
    ////////////////////////////////////////
        //output: result [1]
        //input: operand1 [1]
        //input: operand2 [1]
    and myAnd(andResult, branch, andGateInput);
        //andResult



    /////////////////////////////////////////
    ///////////Left Shift 1//////////////////
    ////////////////////////////////////////
        //input: operand [16]
        //output: shiftResult [16]
    shiftLeft myShift1(immediate, shiftedImmediate);
        //shiftedImmediate


    /////////////////////////////////////////
    ///////////Adder 1 (PC +2)//////////////
    ////////////////////////////////////////    
        //input: operand1 [16]
        //input: operand2 [16]
        //output: adderResult [16]
    adder myAdder1(pcOutput, 16'd2, incrementedPc);
        //incrementedPc [16]



    /////////////////////////////////////////
    ///////////Jump Sign Extender///////////
    ////////////////////////////////////////
        //input: imm [12]
        //output: extendedImm [16]
    jumpSignExtender myJumpSignExtend(instruction[11:0], extendedJump);
        //extendedJump [16]
    

    /////////////////////////////////////////
    ///////////Left Shift 2//////////////////
    ////////////////////////////////////////
        //input: operand [16]
        //output: shiftResult [16]
    shiftLeft myShift2(extendedJump, shiftedJump);
        //shiftedJump [16]




    /////////////////////////////////////////
    /////////Adder 2 (PC + Jump)////////////
    ////////////////////////////////////////    
        //input: operand1 [16]
        //input: operand2 [16]
        //output: adderResult [16]
    adder myAdder2(shiftedJump, incrementedPc, finalJumpAddress);
        //finalJumpAddress [16]



    /////////////////////////////////////////
    /////////Adder 3 (PC + Immediate)////////
    ////////////////////////////////////////  
        //input: operand1 [16]
        //input: operand2 [16]
        //output: adderResult [16]
    adder myAdder3(incrementedPc, shiftedImmediate, finalBranchAddress);
        //finalBranchAddress [16]




    /////////////////////////////////////////
    //////////////MUX 4 (branch)////////////////
    /////////////////////////////////////////
        //input: selector [1]
        //input: choosePath0 [16]
        //input: choosePath1 [16]
        //output: chosenPath [16]
    mux myMux4(andResult, incrementedPc, finalBranchAddress, pcOrBranch);
        //pcOrBranch [16]


    /////////////////////////////////////////
    //////////////MUX 5 (jump)////////////////
    /////////////////////////////////////////
        //input: selector [1]
        //input: choosePath0 [16]
        //input: choosePath1 [16]
        //output: chosenPath [16]
    mux myMux5(jump, pcOrBranch, finalJumpAddress, pcPlusTwo);
        //pcPlusTwo [16]


endmodule


