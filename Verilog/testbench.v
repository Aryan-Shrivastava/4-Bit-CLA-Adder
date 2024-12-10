`include "design.v"
module testbench();

    reg [3:0] A, B;
    reg C0,clk;
    wire [3:0] S;
    wire Cout;

    cla function_CLA (
        .A_in(A),
        .B_in(B),
        .C0(C0),
        .S_out(S),
        .Cout(Cout),
        .clk(clk)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0,testbench);
        $monitor("Time=%0t | A=%b | B=%b | C0=%b | S=%b | Cout=%b",$time, A, B, C0, S, Cout);  

        A = 4'b0000; B = 4'b0000; C0 = 0;
        #12 A = 4'b0011; B = 4'b0001; C0 = 0;
        #12 A = 4'b0111; B = 4'b0001; C0 = 0;
        #12 A = 4'b1111; B = 4'b1111; C0 = 0;
        #12 A = 4'b1001; B = 4'b0000; C0 = 0;
        #12 A = 4'b1010; B = 4'b1010; C0 = 0;
        #12 A = 4'b1111; B = 4'b1111; C0 = 0;
        #12 A = 4'b1010; B = 4'b0101; C0 = 0;
        #12 A = 4'b0001; B = 4'b0000; C0 = 0;
        #12 A = 4'b0000; B = 4'b0000; C0 = 0; 
        #12 A = 4'b0110; B = 4'b0101; C0 = 0; 
        #12 A = 4'b1001; B = 4'b0111; C0 = 0; 
        #120 $finish;
    end
endmodule
