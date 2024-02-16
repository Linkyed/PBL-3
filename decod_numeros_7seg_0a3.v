module decod_numeros_7seg_0a3 (
  input C, D,
  output reg sA, sB, sC, sD, sE, sF, sG
);

  always @*
    begin
      sA = ~C & D;

      sC = C & ~D;

      sD = ~C & D;

      sE = ~C & D | C & D;

      sF = ~C & D | C & ~D| C & D;

      sG = ~C & ~D | ~C & D;
    end
	
endmodule