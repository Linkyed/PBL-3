module decod_2_4(A, B, out0, out1, out2, out3);
	input A, B; 
	output  reg out0, out1, out2, out3;
	
	always @*
    begin
      out0 = ~A & ~B;

      out1 = ~A & B;

      out2 = A & ~B;

      out3 = A & B;

    end

endmodule