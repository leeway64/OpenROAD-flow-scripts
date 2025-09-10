module proof_of_concept_top
(
    input clk,
    input logic [5:0] a_i,
    input logic [5:0] b_i,
    input logic clk_2,
    output logic y_o
);
    logic a_q_0, a_d_0, a_q_1, a_d_1, a_q_2, a_d_2, a_q_3, a_d_3, a_q_4, a_d_4, a_q_5, a_d_5;
    logic b_q_0, b_d_0, b_q_1, b_d_1, b_q_2, b_d_2, b_q_3, b_d_3, b_q_4, b_d_4, b_q_5, b_d_5;


    assign a_d_0 = a_i[0];
    assign a_d_1 = a_i[1];
    assign a_d_2 = a_i[2];
    assign a_d_3 = a_i[3];
    assign a_d_4 = a_i[4];
    assign a_d_5 = a_i[5];

    assign b_d_0 = b_i[0];
    assign b_d_1 = b_i[1];
    assign b_d_2 = b_i[2];
    assign b_d_3 = b_i[3];
    assign b_d_4 = b_i[4];
    assign b_d_5 = b_i[5];

    always @(posedge clk) begin
        a_q_0 <= a_d_0;
        a_q_1 <= a_d_1;
        a_q_2 <= a_d_2;
        a_q_3 <= a_d_3;
        a_q_4 <= a_d_4;
        a_q_5 <= a_d_5;

        b_q_0 <= b_d_0;
        b_q_1 <= b_d_1;
        b_q_2 <= b_d_2;
        b_q_3 <= b_d_3;
        b_q_4 <= b_d_4;
        b_q_5 <= b_d_5;
    end


    logic temp_1, temp_2, temp_3, temp_4, temp_5, temp_6, temp_7, temp_8, temp_9, temp_10, temp_11, temp_12;

    logic d_1, q_1;
    logic d_2, q_2;
    
  	assign temp_1 = a_q_0 && temp_12;

    assign d_1 = temp_1;
    always @(posedge clk) begin
        q_1 <= d_1;
    end


    assign temp_2 = b_q_0 || q_1;

    assign d_2 = temp_2;
    always @(posedge clk) begin
        q_2 <= d_2;
    end

    assign temp_3 = a_q_1 && q_2;
    assign temp_4 = b_q_1 || temp_3;
    assign temp_5 = a_q_2 && temp_4;
    assign temp_6 = b_q_2 || temp_5;
    assign temp_7 = a_q_3 && temp_6;
    assign temp_8 = b_q_3 || temp_7;
    assign temp_9 = a_q_4 && temp_8;
    assign temp_10 = b_q_4 || temp_9;
    assign temp_11 = a_q_5 && temp_10;
    assign temp_12 = b_q_5 || temp_11;

    assign y_o = temp_12;
endmodule
