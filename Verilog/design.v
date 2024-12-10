module PFA(A, B, Cin, P, Gb, Si);

    input A, B, Cin;
    output P, Gb, Si;
    xor (P, A, B);
    nand (Gb, A, B);
    xor (Si, P, Cin);

endmodule

module dff(q,d,clk);
    input d,clk;
    output reg q;
    always @(posedge clk) begin
            q <= d;       
    end
endmodule


module cla(A_in, B_in, C0,clk, S_out,Cout );
    input [3:0] A_in, B_in;
    input C0,clk;
    output [3:0] S_out;
    output Cout ;

    dff ffA0 (.d(A_in[0]), .clk(clk), .q(A[0])),
        ffA1 (.d(A_in[1]), .clk(clk), .q(A[1])),
        ffA2 (.d(A_in[2]), .clk(clk), .q(A[2])),
        ffA3 (.d(A_in[3]), .clk(clk), .q(A[3])),
        ffB0 (.d(B_in[0]), .clk(clk), .q(B[0])),
        ffB1 (.d(B_in[1]), .clk(clk), .q(B[1])),
        ffB2 (.d(B_in[2]), .clk(clk), .q(B[2])),
        ffB3 (.d(B_in[3]), .clk(clk), .q(B[3])),
        ffC0 (.d(C4), .clk(clk), .q(Cout)),
        ffS0 (.d(S[0]), .clk(clk), .q(S_out[0])),
        ffS1 (.d(S[1]), .clk(clk), .q(S_out[1])),
        ffS2 (.d(S[2]), .clk(clk), .q(S_out[2])),
        ffS3 (.d(S[3]), .clk(clk), .q(S_out[3]));

    wire [3:0] A, B,S;
    wire P0, P1, P2, P3;
    wire G0, G1, G2, G3;
    wire C1, C2, C3, C4;
    PFA pfa0 (.A(A[0]), .B(B[0]), .Cin(C0), .P(P0), .Gb(G0), .Si(S[0]));
    PFA pfa1 (.A(A[1]), .B(B[1]), .Cin(C1), .P(P1), .Gb(G1), .Si(S[1]));
    PFA pfa2 (.A(A[2]), .B(B[2]), .Cin(C2), .P(P2), .Gb(G2), .Si(S[2]));
    PFA pfa3 (.A(A[3]), .B(B[3]), .Cin(C3), .P(P3), .Gb(G3), .Si(S[3]));

    wire w1, w2, w3, w4, w5, w6, w7, w8,w9,w10,w11,w12,w13,w14;

    nand(w1, P0, C0);
    not(w2, G0);
    nand(C1,w1,G0);

    nand(w3, P1, w2);
    nand(w4, P1, P0, C0);
    not(w5, G1);
    nand(C2,w3,w4,G1);

    nand(w6, P2, w5);
    nand(w7, P2, P1, w2);
    nand(w8, P2, P1, P0, C0);
    not(w9, G2);
    nand(C3,w6,w7,w8,G2);

    nand(w10, P3, w9);
    nand(w11, P3, P2, w5);
    nand(w12, P3, P2, P1, w2);
    nand(w13, P3, P2, P1, P0, C0);
    nand(C4,w10,w11,w12,w13,G3);

endmodule