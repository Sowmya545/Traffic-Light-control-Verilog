module TCL(clk,rst,red,yellow,green);
  input clk,rst;
  output reg red,yellow,green;
  reg [1:0] current_state,next_state;
  
  parameter Red=2'b00;
  parameter Yellow=2'b01;
  parameter Green=2'b10;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
      current_state <= Red;
      else
          current_state <= next_state;
        case({current_state})
          Red:begin
              next_state<=Yellow;
              red<=1'b1;
              yellow<=1'b0;
              green<=1'b0;
            end
          Yellow:begin
              next_state <= Green;
              red<=1'b0;
              yellow<=1'b1;
              green<=1'b0;
            end
          Green:begin
              next_state<=Red;
              red<=1'b0;
              yellow<=1'b0;
              green<=1'b1;
            end
          default:begin
            next_state<=Red;
         
          end
        endcase
    end
endmodule
