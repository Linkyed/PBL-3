module MUX_4_1 (
  input [6:0] A,
  input [6:0] B,
  input [6:0] C,
  input [6:0] D,
  input [1:0] SEL,
  output reg [6:0] OUT
);

  always @*
    case (SEL)
      2'b00: OUT = A;
      2'b01: OUT = B;
      2'b10: OUT = C;
      2'b11: OUT = D;
    endcase

endmodule