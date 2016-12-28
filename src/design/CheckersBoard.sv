// represents each point on the checkers board
typedef enum logic [2:0] {EMPTY, PL1, PL2 = 3'b011, PL1KING = 3'b101, PL2KING = 3'b111} Piece; // 2nd bit king, 1st bit player, 0th bit occupied

typedef enum logic {PLAYER1, PLAYER2} Player;

/*
 * Data processor for the checkers board
 * Contains 8 by 8 array of pieces, takes input from buttons, modifies board according to game rules, sends status outputs.
 */
module CheckersBoard(
    input logic clk, btnC, btnU, btnL, btnD, btnR, btnD1, // btnD1 unsynchronized, to check for holding
    input logic [2:0] row, col,
    output Piece piece,
    output Player player,
    output logic [2:0] curRow, curCol,
    output logic [3:0] scores[1:0] // 0th element for PLAYER1, 1st for PLAYER2
    );
    
    Piece board [7:0][7:0];
    logic selected; // whether the cursor has selected a piece
    logic [3:0] nextRow, nextCol, rowDir, colDir;
    logic rst = 1;
    
    Piece p;
    logic [2:0] r, c;
    logic finish;
    InitBoard i(clk, rst, r, c, p, finish);
    
    assign piece = board[row][col];
    
    // calculating directions of piece
    assign rowDir = btnD1 ^ player ? -1 : 1; // down button held
    assign colDir = btnL ? 1 : -1;
    assign nextRow = rowDir + curRow;
    assign nextCol = colDir + curCol;
   
    always @(posedge clk) begin
        if (rst) begin // also called after game over
            if (!finish)
                board[r][c] = Piece'(p);
            else begin
                rst <= 0;
                curRow <= 2;
                curCol <= 4;
            
                player <= PLAYER1; // start from player 1
                scores[0] <= 0; // scores initially 0
                scores[1] <= 0;
            end
        end else begin
            if (scores[0] == 12 || scores[1] == 12)
                rst <= 1;
            
            // select cell, checking whether it is occupied by current player
            if (btnC && board[curRow][curCol][0] && board[curRow][curCol][1] == player)
                selected <= !selected;
                
            if (!selected) begin
                // move cursor based on button input
                if (btnU)
                    ++curRow;
                else if (btnD)
                    --curRow;
                if (btnL)
                    ++curCol;
                else if (btnR)
                    --curCol;
            end else if (btnL || btnR) begin // moving a selected piece
                
                // check whether row or col out of bounds by checking nextXXX[3]
                if (!nextRow[3] && !nextCol[3]) begin
                    
                    // if next cell not occupied, move piece there
                    if (!board[nextRow][nextCol] &&
                        (!btnD1 || board[curRow][curCol][2])) begin // can only move down if king
                        
                        // move to (nextRow,nextCol)
                        board[nextRow][nextCol] <= Piece'(board[curRow][curCol] | ((player ? !nextRow : &nextRow) << 2)); // making piece king
                        board[curRow][curCol] <= EMPTY;
                        curRow <= nextRow;
                        curCol <= nextCol;
                        player <= Player'(!player); // toggle player
                        selected <= 0;
                    end else begin
                        // if occupied by another player, but (nextRow+rowDir,nextCol+colDir) not occupied,
                        // move there, capturing the other player's piece, and update table and scores
                        if (//nextRow + rowDir < 8 && nextCol + colDir < 8 && // boundary check
                            !board[nextRow+rowDir][nextCol+colDir] && // destination not occupied
                            board[nextRow][nextCol][1] ^ board[curRow][curCol][1] && // different players
                            (!btnD1 || board[curRow][curCol][2])) begin
                            
                            // move to (nextRow+rowDir,nextCol+colDir)
                            board[nextRow+rowDir][nextCol+colDir] <= Piece'(board[curRow][curCol] | ((player ? !(nextRow+rowDir) : &(nextRow+rowDir)) << 2)); // making piece king
                            board[curRow][curCol] <= EMPTY;
                            board[nextRow][nextCol] <= EMPTY;
                            curRow <= nextRow + rowDir;
                            curCol <= nextCol + colDir;
                            // player <= Player'(!player); // same player continues after scoring
                            
                            // eliminate (nextRow,nextRow)
                            scores[player] <= scores[player] + 1;
                            selected <= 0;
                        end
                    end
                end
            end
        end
    end
endmodule
