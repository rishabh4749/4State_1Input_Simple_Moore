`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 19:01:28
// Design Name: 
// Module Name: des
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module des(
    input clk,
    input in,
    input areset,
    output out); 
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next_state;
    always @(*) begin
        state <= next_state;
    end
    always @(posedge clk or posedge areset) begin
            if(areset)
                next_state <= A;
            else 
            begin
                case (state)
                    A : begin
                        if(in == 1'b1)
                            next_state <= B;
                        else
                            next_state <= A;
                    end

                    B : begin
                        if(in == 1'b1)
                            next_state <= B;
                        else
                            next_state <= C;
                    end

                    C : begin
                        if(in == 1'b1)
                            next_state <= D;
                        else
                            next_state <= A;
                    end

                    D : begin
                        if(in == 1'b1)
                            next_state <= B;
                        else
                            next_state <= C;
                    end

                    default:
                        begin
                            next_state <= A;
                        end
                endcase
            end
        end
    assign out = (state == D)?1:0;

endmodule
