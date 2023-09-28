module synchronous_ram_tb;
  parameter ADDR_SIZE = 2;
  parameter DATA_SIZE = 8;
 
  reg [ADDR_SIZE-1:0] addr;
  reg RD, WE, CS, clk, reset;
  reg [DATA_SIZE-1:0] dataIn;
  wire [DATA_SIZE-1:0] dataOut;

  synchronous_ram #(
    .ADDR_SIZE(ADDR_SIZE),
    .DATA_SIZE(DATA_SIZE)
  )dut (
    .addr(addr),
    .RD(RD),
    .WE(WE),
    .CS(CS),
    .clk(clk),
    .reset(reset),
    .dataIn(dataIn),
    .dataOut(dataOut)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    $dumpfile("synchronous_ram_waveform.vcd");
    $dumpvars(0, synchronous_ram_tb);
    addr = 2'b00;
    RD = 0;
    WE = 0;
    CS = 0;
    reset = 1;
    clk = 0;
    dataIn = 8'b00000000;

    #10 reset = 0;

    // Write operation
    addr = 2'b01;
    WE = 1;
    CS = 1;
    dataIn = 8'b11001100;
    #10 WE = 0;
    $display("Writing %b at addr %b", dataIn, addr);

    // Read operation
    addr = 2'b01;
    RD = 1;
    CS = 1;
    #10 RD = 0;
    $display("Data at %b: %b", addr,dataOut);

    // Write operation
    addr = 2'b10;
    WE = 1;
    CS = 1;
    dataIn = 8'b11110000;
    #10 WE = 0;
    $display("Writing %b at addr %b", dataIn, addr);

    // Read operation
    addr = 2'b10;
    RD = 1;
    CS = 1;
    #10 RD = 0;
    $display("Data at %b: %b", addr,dataOut);

    $finish;
  end
endmodule
