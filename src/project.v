`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

  wire nD2, w1, Y1, Y0, V;

  not U1 (nD2, ui_in[2]);
  and U2 (w1, nD2, ui_in[1]);
  or  U3 (Y1, ui_in[3], ui_in[2]);
  or  U4 (Y0, ui_in[3], w1);
  or  U5 (V, ui_in[3], ui_in[2], ui_in[1], ui_in[0]);

  assign uo_out  = {5'b00000, V, Y1, Y0};
  assign uio_out = 8'b00000000;
  assign uio_oe  = 8'b00000000;

  wire _unused = &{ena, clk, rst_n, ui_in[7:4], uio_in, 1'b0};

endmodule
