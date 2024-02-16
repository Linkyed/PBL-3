module contador_3bit_padrao (
  input clk, // Sinal de Clock (borda de subida)
  input reset, // Sinal de Reset
  output reg [2:0] count // Saída de 3 bits
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Se o sinal de Reset estiver ativo, resetamos para 0
      count <= 3'b000;
    end else begin
      // Caso contrário, incrementamos o contador
      count <= count + 1;
    end
  end

endmodule