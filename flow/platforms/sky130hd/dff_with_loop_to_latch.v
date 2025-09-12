module \$_SDFFE_PN0P_ (input D, C, R, E, output Q);
    wire temp_q;
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(C && E),
        .D(D),
        .Q(temp_q)
    );

    always @(*) begin
        if (R && C) begin
            Q <= 1'b0;
        end else begin
            Q <= temp_q;
        end
    end

endmodule

module \$_SDFFE_PP0P_ (input D, C, R, E, output Q);
    wire temp_q;
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(C && E),
        .D(D),
        .Q(temp_q)
    );
    
    always @(*) begin
        if (!R && C) begin
            Q <= 1'b0;
        end else begin
            Q <= temp_q;
        end   
    end
endmodule

module \$_DFFE_PP0P_ (input D, C, R, E, output Q);
    sky130_fd_sc_hd__dlrtp_1 _TECHMAP_REPLACE_ (
        .GATE(C && E),
        .RESET_B(!R),
        .D(D),
        .Q(Q)
    );
endmodule
