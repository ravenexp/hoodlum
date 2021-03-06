
// File: rise_ice.v
// Generated by MyHDL 0.9.0
// Date: Mon Aug 15 16:53:08 2016


`timescale 1ns/10ps

module rise_ice (
           clk,
           D1,
           D2,
           D3,
           D4,
           D5
       );


input clk;
output D1;
wire D1;
output D2;
wire D2;
output D3;
wire D3;
output D4;
wire D4;
output D5;
wire D5;

reg [3:0] rot;
reg ready = 0;
reg [20:0] divider;





always @(posedge clk) begin: RISE_ICE_TOGGLE_LED
    if (ready) begin
        if (($signed({1'b0, divider}) == (1200000 - 1))) begin
            divider <= 0;
            rot <= {rot[3-1:0], rot[3]};
        end
        else begin
            divider <= (divider + 1);
        end
    end
    else begin
        ready <= 1;
        rot <= 4'b0001;
        divider <= 0;
    end
end



assign D1 = rot[0];
assign D2 = rot[1];
assign D3 = rot[2];
assign D4 = rot[3];
assign D5 = 1;

endmodule
