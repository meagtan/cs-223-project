/*
 * Testbench for the module ledmatrix.
 */
module ledmatrixsim(

    );
    
    logic clk, oe, ds1, srclk, stclk, mr;
    logic [2:0] piece, row, col, curRow, curCol;
    logic [7:0] cols;
    ledmatrix l(clk, piece, curRow, curCol, row, col, cols, oe, ds1, srclk, stclk, mr);
    
    defparam l.N = 2; //4;
    
    assign piece = (row <= 2 && (col + row) & 1) ? 3'b011 : (row >= 5 && (col + row) & 1) ? 3'b001 : 0;
    assign curRow = 2;
    assign curCol = 4;
    
    always begin
            clk <= 1; #1; clk <= 0; #1;
    end
endmodule
