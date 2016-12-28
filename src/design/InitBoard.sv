/*
 * Auxiliary module to initialize board
 * Goes through each row and column and returns the corresponding piece.
 */
module InitBoard(
    input clk,
    input en,                       // whether the module is enabled
    output logic [2:0] row, col,    // the row and column currently iterated through
    output logic [2:0] piece,       // the piece assigned to (row, col)
    output logic finish             // whether the iteration is finished
    );
    
    logic [5:0] cnt = 0;
    logic fin = 0;
    assign finish = fin;
    assign {col,row} = cnt;
    assign piece = (row <= 2 && (col & 1 ^ row & 1)) ? 3'b001 : (row >= 5 && (col & 1 ^ row & 1)) ? 3'b011 : 0;
    
    always @(posedge en)
        fin <= 0;
    
    always @(posedge clk)
        if (!fin) begin
            cnt <= cnt + 1;
            fin <= &cnt;
        end
endmodule
