module decod_numeros_7seg_0a9 (
  input A, B, C, D,
  output reg sA, sB, sC, sD, sE, sF, sG
);

  always @*
    begin
      // S0 ~A~B~CD + ~AB~C~D
      sA = ~A & ~B & ~C & D | ~A & B & ~C & ~D;

      // S1 ~AB~CD + ~ABC~D
      sB = ~A & B & ~C & D | ~A & B & C & ~D;

      // S2 ~A~BC~D
      sC = ~A & ~B & C & ~D;

      // S3 ~AB~C~D + ~ABCD + ~B~CD
      sD = ~A & B & ~C & D | ~A & B & C & D | ~B & ~C & D;

      // S4 ~B~CD + ~AB~C + ~AD
      sE = ~B & ~C & D | ~A & B & ~C | ~A & D;

      // S5 ~A~BD + ~A~BC + ~ACD
      sF = ~A & ~B & D | ~A & ~B & C | ~A & C & D;

      // S6 ~ABCD + ~A~B~C
      sG = ~A & B & C & D | ~A & ~B & ~C;
    end
	

endmodule