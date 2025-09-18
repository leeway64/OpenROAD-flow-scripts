// This file converts a DFF that is used in one of the example designs into an 
// "equivalent" latch

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity enable."
module \$_DFFE_PP_
(
    input D,
    input C,
    input E,
    output Q
);

    wire mux_latch_output;
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_.mux_latch
    (
        .GATE(C),
        .D(Q),
        .Q(mux_latch_output)
    );

    wire mux_output;
    sky130_fd_sc_hd__mux2_1 MUX
    (
        .A0(mux_latch_output),
        .A1(D),
        .S(E),
        .X(mux_output)
    );

    // dlxtp only has a size of 1
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_.main_latch (
        .GATE(C),
        .D(mux_output),
        .Q(Q)
    );

endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop."
module \$_DFF_P_
(
    input D,
    input C,
    output Q
);
    // dlxtp only has 1 size
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_
    (
        .D(D),
        .GATE(C),
        .Q(Q)
    );
endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with negative polarity synchronous reset and positive 
//      polarity clock enable (with reset having priority)".
module \$_SDFFE_PN0P_
(
    input D,
    input C,
    input R,
    input E,
    output Q
);

    wire mux_output_1;
    sky130_fd_sc_hd__mux2_1 MUX_1
    (
        .A0(Q),
        .A1(D),
        .S(E),
        .X(mux_output_1)
    );

    wire mux_output_2;
    sky130_fd_sc_hd__mux2_1 MUX_2
    (
        .A0(1'b0),
        .A1(mux_output_1),
        .S(R),
        .X(mux_output_2)
    );
    
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(C),
        .D(mux_output_2),
        .Q(Q)
    );

endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity synchronous reset and positive
//      polarity clock enable (with reset having priority)."
module \$_SDFFE_PP0P_
(
    input D,
    input C,
    input R,
    input E,
    output Q
);

    wire mux_output_1;
    sky130_fd_sc_hd__mux2_1 MUX_1
    (
        .A0(Q),
        .A1(D),
        .S(E),
        .X(mux_output_1)
    );

    wire mux_output_2;
    sky130_fd_sc_hd__mux2_1 MUX_2
    (
        .A0(mux_output_1),
        .A1(1'b0),
        .S(R),
        .X(mux_output_2)
    );
    
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(C),
        .D(mux_output_2),
        .Q(Q)
    );

endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity synchronous reset."
module \$_SDFF_PP0_
(
    input D,
    input C,
    input R,
    output Q
);

    wire mux_output;
    sky130_fd_sc_hd__mux2_1 MUX
    (
        .A0(D),
        .A1(1'b0),
        .S(R),
        .X(mux_output)
    );

    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(C),
        .D(mux_output),
        .Q(Q)
    );

endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity synchronous set."
module \$_SDFF_PP1_
(
    input D,
    input C,
    input R,
    output Q
);

    wire mux_output;
    sky130_fd_sc_hd__mux2_1 MUX
    (
        .A0(D),
        .A1(1'b1),
        .S(R),
        .X(mux_output)
    );

    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(C),
        .D(mux_output),
        .Q(Q)
    );

endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity reset and positive polarity clock
//      enable."
module \$_DFFE_PP0P_
(
    input D,
    input C,
    input R,
    input E,
    output Q
);

    wire mux_output;
    sky130_fd_sc_hd__mux2_1 MUX
    (
        .A0(Q),
        .A1(D),
        .S(E),
        .X(mux_output)
    );

    wire reset;
    sky130_fd_sc_hd__inv_1 INV (
        .A(R),
        .Y(inv_reset)
    );

    sky130_fd_sc_hd__dlrtp_1 _TECHMAP_REPLACE_ (
        .GATE(C),
        .RESET_B(inv_reset),
        .D(mux_output),
        .Q(Q)
    );

endmodule

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity reset."
module \$_DFF_PP0_
(
    input D,
    input C,
    input R,
    output Q
);

    wire inv_reset;
    sky130_fd_sc_hd__inv_1 INV (
        .A(R),
        .Y(inv_reset)
    );

    sky130_fd_sc_hd__dlrtp_1 _TECHMAP_REPLACE_ (
        .GATE(C),
        .RESET_B(inv_reset),
        .D(D),
        .Q(Q)
    );

endmodule
