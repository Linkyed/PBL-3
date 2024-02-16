module contador_4bit_desc_lim5 (
  input clk, // Sinal de Clock (borda de subida)
  input reset, // Sinal de Reset
  output reg [3:0] count // Saída de 3 bits
);

  reg [3:0] next_count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Se o sinal de Reset estiver ativo, resetamos para 5
      count <= 4'b0101;
    end else begin
      // Caso contrário, decrementamos o contador
      count <= next_count;
    end
  end

  always @* begin
    // Lógica para calcular o próximo valor do contador
    if (count == 4'b0000) begin
      next_count = 4'b1001; // Se o contador chegar a 0, resetamos para 9
    end else begin
      next_count = count - 1; // Caso contrário, decrementamos
    end
  end

endmodule