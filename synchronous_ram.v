module synchronous_ram  #(
    parameter ADDR_SIZE = 2,
    parameter DATA_SIZE = 8
  )(
    input wire [ADDR_SIZE-1:0] addr,
    input wire RD,
    input wire WE,
    input wire CS,
    input wire clk,
    input wire reset,
    input wire [DATA_SIZE-1:0] dataIn,
    output wire [DATA_SIZE-1:0] dataOut
  );

  integer i;
  reg [7:0] mem [3:0];

  always @(posedge clk)
  begin
    if (reset)
    begin
      mem[0] <= 8'b00000000;
      mem[1] <= 8'b00000000;
      mem[2] <= 8'b00000000;
      mem[3] <= 8'b00000000;
    end
    else
    begin
      if (WE && CS)
        mem[addr] <= dataIn;
    end
  end

  assign dataOut = (RD && CS) ? mem[addr] : 8'b00000000;

endmodule
