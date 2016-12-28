/*
 * Button press synchronizer
 * out is only high for one clock cycle after in becomes high
 */
module synch(input  logic clk, in,
             output logic out);
	logic prev = 0;
    
    always @(posedge clk) begin
        prev <= in;
        out <= in & !prev;
    end
endmodule
