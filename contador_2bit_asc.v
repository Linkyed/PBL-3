module contador_2bit_asc (
  input clk, 
  input reset, 
  output reg [1:0] count 
);

  reg [1:0] next_count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin

      count <= 2'b00;
    end else begin

      count <= next_count;
    end
  end

  always @* begin

    if (count == 2'b11) begin
      next_count = 2'b00; 
    end else begin
      next_count = count + 1; 
    end
  end

endmodule