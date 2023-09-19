# Dual port Synchronous SRAM

A parameterized dual port Synchronous SRAM with an asynchronous read port.

- The Synchronous SRAM module consists of a n-bit data input line, dataIn and a n-bit data output line, dataOut.
- The module uses an n-bit address line, Addr, to locate the position of the data-byte within the memory array.
- The module is clocked using the 1-bit input clock line Clk.
- The module is reset with a 1-bit active high synchronous reset signal. reset signal will clear the whole memory when high.The module also has a 1-bit chip select line, CS.
- The 1-bit RD line is used to signal a data read operation on the Synchronous SRAM and the 1-bit WE line is used to signal a data write operation on the Synchronous SRAM.
- Both the RD and WE lines are active high.


# Entity: synchronous_ram 
- **File**: synchronous_ram.v

## Diagram
![Diagram](synchronous_ram.svg "Diagram")
## Ports

| Port name | Direction | Type       | Description |
| --------- | --------- | ---------- | ----------- |
| addr      | input     | wire [1:0] |             |
| RD        | input     | wire       |             |
| WE        | input     | wire       |             |
| CS        | input     | wire       |             |
| clk       | input     | wire       |             |
| reset     | input     | wire       |             |
| dataIn    | input     | wire [7:0] |             |
| dataOut   | output    | wire [7:0] |             |

## Signals

| Name      | Type      | Description |
| --------- | --------- | ----------- |
| i         | integer   |             |
| mem [3:0] | reg [7:0] |             |

## Circuit Diagram
![Diagram](synchronous_ram_schematic.svg "Circuit-Diagram")