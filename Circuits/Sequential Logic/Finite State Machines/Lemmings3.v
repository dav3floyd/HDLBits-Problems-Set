module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter left = 0, right = 1;
    parameter left_ground = 2, right_ground = 3;
    parameter left_dig = 4, right_dig = 5;

    reg [2:0] state, next_state;

    always @(posedge clk or posedge areset) begin
        if (areset) 
            state <= left;
        else 
            state <= next_state;
    end

    always @(*) begin
        case (state)
            left: begin
                if (ground) begin
                    if (dig) 
                        next_state <= left_dig;
                    else 
                        next_state <= bump_left ? right : left;
                end
                
                else
                    next_state <= left_ground;
            end
            
            right: begin
                if (ground) begin
                    if (dig) 
                        next_state <= right_dig;
                    else 
                        next_state <= bump_right ? left : right;
                end
                
                else
                    next_state <= right_ground;
            end
            
            left_dig: begin
                if (ground)
                    next_state <= left_dig;
                else 
                    next_state <= left_ground;
            end
            
            right_dig: begin
                if (ground) 
                    next_state <= right_dig;
                else 
                    next_state <= right_ground;
            end
            
            left_ground: begin
                if (ground) 
                    next_state <= left;
                else 
                    next_state <= left_ground;
            end
            
            right_ground: begin
                if (ground)
                    next_state <= right;
                else
                    next_state <= right_ground;
            end
            
        endcase
    end

    assign walk_left = (state == left);
    assign walk_right = (state == right);
    assign aaah = ((state == left_ground) || (state == right_ground));
    assign digging = ((state == left_dig) || (state == right_dig));

endmodule