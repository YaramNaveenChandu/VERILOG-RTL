module seq_gen (input clk,input reset,output reg [3:0] out);
reg [3:0] counter;
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        out     <= 4'd1;
        counter <= 4'd1;
    end
    else
    begin
        if(counter < out)
        begin
            counter <= counter + 1;
        end
        else
        begin
            out     <= out + 1;
            counter <= 1;
        end
    end
end
endmodule
