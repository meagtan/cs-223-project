typedef enum logic [1:0] {BLUE, GREEN, RED} Color; // player 1 blue, player 2 red

/*
 * RGB dot matrix module
 * Takes information from board, sends it to dot matrix.
 */
module ledmatrix(
    input logic clk,
    input logic [2:0] piece,                    // the piece at point (row, col)
    input logic [2:0] curRow, curCol,           // cursor row and column
    output logic [2:0] row, col,                // current row and column sent
    output logic [7:0] cols,                    // one-hot column enable
    output logic oe, ds1, srclk, stclk, mr      // serial output, shift/storage register clock and reset
    );
    
    parameter N = 10; // hold frame for approx. 2^N clock cycles
    
    logic [24:0] curclk = 0;
    
    logic [N-1:0] srcount = 0;
    logic [7:0] count = -1;
    logic pcol;
    Color color;
    
    // equivalent to "assign {col, color, row} = count;"
    assign col = count[7:5];
    assign row = count[2:0];
    assign color = Color'(oe ? count[4:3] : 0); 
    
    assign cols = 1 << col;
    assign oe = (count[4:0] < 24);
    assign mr = 1;
    
    assign srclk = !srcount[N-1] && oe;
    assign stclk = !oe || !srclk; // TODO perhaps wait one clock cycle
    assign ds1 = oe && pcol;
    assign pcol = (curclk[24] && row == curRow && col == curCol && !color[0]) ||    // blink cursor purple
                  (piece[0] && !color[0] && piece[1] == color[1]);                  // piece is occupied and same color
   
    always @(posedge clk) begin
        curclk <= curclk + 1;
        srcount <= srcount + 1;
        if (!srcount) begin
            count <= count + 1;
        end
    end
    
endmodule
