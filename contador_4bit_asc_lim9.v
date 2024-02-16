module contador_4bit_asc_lim9 (
  input clk, 
  input reset,
  output reg [3:0] count 
);

  reg [3:0] next_count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
     
      count <= 4'b0000;
    end else begin
      
      count <= next_count;
    end
  end

  always @* begin
    
    if (count == 4'b1001) begin
      next_count = 4'b0000; 
    end else begin
      next_count = count + 1; 
    end
  end

endmodule