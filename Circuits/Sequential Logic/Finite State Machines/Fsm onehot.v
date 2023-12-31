module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8, J=9;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (state[A]|state[B]|state[C]|state[D]|state[E]|state[H]|state[I]|state[J])& (~in);
    assign next_state[B] = state[A] & in | state[I] & in | state[J] & in;
    assign next_state[C] = state[B] & in;
    assign next_state[D] = state[C] & in;
    assign next_state[E] = state[D] & in;
    assign next_state[F] = state[E] & in;
    assign next_state[G] = state[F] & in;
    assign next_state[H] = (state[G] & in) | (state[H] & in);
    assign next_state[I] = state[F] & (~in);
    assign next_state[J] = state[G] & (~in);

    // Output logic: 
    assign out1 = ((state[I] == 1) | (state[J] == 1));
    assign out2 = ((state[H] == 1) | (state[J] == 1));
    
endmodule