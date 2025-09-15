// Refer to these two files for more information on mapping:
//  OpenROAD-flow-scripts/flow/platforms/sky130hd/cells_latch_hd.v
//  $env(PDK_ROOT)/sky130A/libs.tech/openlane/sky130_fd_sc_hd/latch_map.v



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



// edfxtp and dlxtp only have a size of 1
module sky130_fd_sc_hd__edfxtp_1
(
    input CLK,
    input D,
    input DE,
    output Q
);

    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(CLK && DE),
        .D(D),
        .Q(Q)
    );

endmodule

// dfrtn only has 1 size (1), but dlrtn has sizes of 1, 2, 4, so I am selecting dlrtn of size 1 to
// match dfrtn
module sky130_fd_sc_hd__dfrtn_1
(
    input CLK_N,
    input D,
    input RESET_B,
    output Q
);
    sky130_fd_sc_hd__dlrtn_1 _TECHMAP_REPLACE_
    (
        .RESET_B(RESET_B),
        .D(D),
        .GATE_N(CLK_N),
        .Q(Q)
    );
endmodule

// dfrtp and dlrtp both have sizes of 1, 2, and 4, so I need to match each size manually
module sky130_fd_sc_hd__dfrtp_1
(
    input CLK,
    input D,
    input RESET_B,
    output Q
);
    sky130_fd_sc_hd__dlrtp_1 _TECHMAP_REPLACE_ (
        .RESET_B(RESET_B),
        .D(D),
        .GATE(CLK),
        .Q(Q)
    );
endmodule

module sky130_fd_sc_hd__dfrtp_2
(
    input CLK,
    input D,
    input RESET_B,
    output Q
);
    sky130_fd_sc_hd__dlrtp_2 _TECHMAP_REPLACE_ (
        .RESET_B(RESET_B),
        .D(D),
        .GATE(CLK),
        .Q(Q)
    );
endmodule

module sky130_fd_sc_hd__dfrtp_4
(
    input CLK,
    input D,
    input RESET_B,
    output Q
);
    sky130_fd_sc_hd__dlrtp_4 _TECHMAP_REPLACE_ (
        .RESET_B(RESET_B),
        .D(D),
        .GATE(CLK),
        .Q(Q)
    );
endmodule

(* techmap_celltype="sky130_fd_sc_hd__dfstp_[124]" *)
module sky130_fd_sc_hd__dfstp
(
    input CLK,
    input D,
    input SET_B,
    output Q
);
    // The SKY130 PDK doesn't have a latch with asynchronous set, so we need to create one here
    wire D_or_set, gate_or_set;
    assign D_or_set = D || ~SET_B;
    assign gate_or_set = CLK || ~SET_B;

    // Note that dlxtp only has 1 size
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .D(D_or_set),
        .GATE(gate_or_set),
        .Q(Q)
    );
endmodule

(* techmap_celltype="sky130_fd_sc_hd__dfxtp_[124]" *)
module sky130_fd_sc_hd__dfxtp
(
    input CLK,
    input D,
    output Q
);
    // Note that dlxtp only has 1 size
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_
    (
        .D(D),
        .GATE(CLK),
        .Q(Q)
    );
endmodule
