/*
 * Testbench for the module InitBoard
 */
module InitBoardSim();

    logic clk, en = 1, finish;
    logic [2:0] row, col, piece;
    InitBoard b(clk, en, row, col, piece, finish);
    
    always begin
        clk <= 1; #5; clk <= 0; #5;
    end
endmodule
