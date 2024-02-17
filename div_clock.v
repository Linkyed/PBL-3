module div_clock (
  input clk, 
  input reset,
  output reg [13:0] count 
);

  reg [13:0] next_count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
     
      count <= 14'b00000000000000;
    end else begin
      
      count <= next_count;
    end
  end

  always @* begin
    
    if (count == 14'b11111111111111) begin
      next_count = 14'b00000000000000; 
    end else begin
      next_count = count + 1; 
    end
  end

endmodule