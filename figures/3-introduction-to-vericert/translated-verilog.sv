module main(reset, clk, reg_2, finish, return_val);
  output logic [31:0] return_val = 0;
  output logic finish = 0;
  input [31:0] reg_2;
  input clk, reset;

  logic [31:0] reg_8 = 0, reg_4 = 0, d_in = 0;
  logic [31:0] addr = 0, reg_10 = 0, reg_6 = 0, wr_en = 0;
  logic [31:0] d_out = 0, en = 0, u_en = 0;
  logic [31:0] state = 0;

  // BRAM interface
  (* ram_style = "block" *)
  logic [31:0] stack [1:0];
  always @(negedge clk)
    if ({u_en != en}) begin
      if (wr_en) stack[addr] <= d_in;
      else d_out <= stack[addr];
      en <= u_en;
    end

  // Finite-state machine with data path implementation
  always @(posedge clk)
    if ({reset == 32'd1}) state <= 32'd7;
    else case (state)
        32'd21: begin state <= 32'd16; reg_4 <= d_out; end
        32'd16: begin 
          finish <= 32'd1; return_val <= reg_4;
          state <= 32'd16; state <= (32'd0 ? 32'd17 : 32'd16);
        end
        32'd15: begin
          state <= 32'd21; u_en <= ( ~ u_en); wr_en <= 32'd0;
          addr <= {{{reg_6 + 32'd0} + {reg_2 * 32'd4}} / 32'd4};
        end
        32'd14: begin
          state <= 32'd15; u_en <= ( ~ u_en); wr_en <= 32'd1;
          d_in <= reg_8; addr <= 32'd1;
        end
        32'd13: begin
          state <= 32'd14; u_en <= ( ~ u_en); wr_en <= 32'd1;
          d_in <= reg_10; addr <= 32'd0;
        end
        32'd7: begin
          reg_10 <= 32'd3; reg_8 <= 32'd6; reg_6 <= 32'd0; 
          state <= 32'd13;
        end
        default:;
      endcase
endmodule
