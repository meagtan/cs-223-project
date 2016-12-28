module InitBoard(
    input clk,
    input en,
    output logic [2:0] row,
    output logic [2:0] col,
    output logic [2:0] piece,
    output logic finish
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
