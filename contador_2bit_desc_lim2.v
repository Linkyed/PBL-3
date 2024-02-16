module contador_2bit_desc_lim2 (
  input clk, // Sinal de Clock (borda de subida)
  input reset, // Sinal de Reset
  output reg [1:0] count // Saída de 2 bits
);

  reg [1:0] next_count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Se o sinal de Reset estiver ativo, resetamos para 2
      count <= 2'b10;
    end else begin
      // Caso contrário, decrementamos o contador
      count <= next_count;
    end
  end

  always @* begin
    // Lógica para calcular o próximo valor do contador
    if (count == 2'b00) begin
      next_count = 2'b10; // Se o contador chegar a 0, resetamos para 2
    end else begin
      next_count = count - 1; // Caso contrário, decrementamos
    end
  end

endmodule