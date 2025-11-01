`timescale 1ns/1ps

module tb_SmartWaterLevelController;

    reg clk, reset;
    reg S0, S1, S2;
    wire pump;

    SmartWaterLevelController dut (
        .clk(clk),
        .reset(reset),
        .S0(S0), .S1(S1), .S2(S2),
        .pump(pump)
    );

    always #5 clk = ~clk;  // 10ns clock period

    initial begin
        $dumpfile("SmartWaterLevel.vcd");
        $dumpvars(0, tb_SmartWaterLevelController);

        clk = 0;
        reset = 1;
        S0 = 0; S1 = 0; S2 = 0;
        #10 reset = 0;

        #10 S0=0; S1=0; S2=0;  
        #20 S0=1; S1=0; S2=0;  
        #20 S0=1; S1=1; S2=0;  
        #20 S0=1; S1=1; S2=1;  
        #20 S0=1; S1=1; S2=0;  
        #20 S0=1; S1=0; S2=0;  
        #20 S0=0; S1=0; S2=0;  

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | S0=%b S1=%b S2=%b | State=%b | Pump=%b",
                 $time, S0, S1, S2, dut.current_state, pump);
    end

endmodule
