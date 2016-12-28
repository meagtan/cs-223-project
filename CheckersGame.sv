module CheckersGame(input clk, btnC, btnU, btnL, btnD, btnR,
                    output [1:0] play,
                    output [7:0] cols,
                    output oe, ds, srclk, stclk, mr,
                    output [6:0] seg,
                    output dp,
                    output [3:0] an);
	Piece piece;
	Player player;
	logic synC, synU, synL, synD, synR;
	logic [2:0] curRow, curCol, row, col;
	logic [3:0] scores[1:0];
	
	assign play = 1 << player; // decoder
	
	CheckersBoard c(clk, synC, synU, synL, synD, synR, btnD, row, col, piece, player, curRow, curCol, scores);
	synch b1(clk, btnC, synC),
	      b2(clk, btnU, synU),
	      b3(clk, btnL, synL),
	      b4(clk, btnD, synD),
	      b5(clk, btnR, synR);
	ledmatrix l(clk, piece, curRow, curCol, row, col, cols, oe, ds, srclk, stclk, mr);
	SevSeg_4digit s(clk, scores[0] % 10, scores[0] / 10, scores[1] % 10, scores[1] / 10,
                    seg[0], seg[1], seg[2], seg[3], seg[4], seg[5], seg[6], dp, an); 
endmodule
