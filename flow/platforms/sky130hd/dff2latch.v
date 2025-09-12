// This file is inspired by
// https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/master/flow/platforms/sky130hd/cells_latch_hd.v
// That is also similar to this file:
// /home/leeway64/.volare/sky130A/libs.tech/openlane/sky130_fd_sc_hd/latch_map.v
// Refer to this page for a list of all the cells in the SKY130 PDK

// edfxtp and dlxtp only have a size of 1
module sky130_fd_sc_hd__edfxtp_1
(
    input CLK,
    input D,
    input DE,
    output Q
);

    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .CLK(CLK && DE),
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



// ABC can't map sky130_fd_sc_hd__dfbbn, sky130_fd_sc_hd__dfbbp, sky130_fd_sc_hd__dfrbp,
// sky130_fd_sc_hd__dfsbp, and sky130_fd_sc_hd__dfxbp because ABC can't map multi-output gates.
// See the following for more details:
// https://github.com/YosysHQ/yosys/issues/3631#issuecomment-1387506461
// https://github.com/YosysHQ/yosys/discussions/5195#discussioncomment-13760120

module sky130_fd_sc_hd__dfrbp_1
(
    input CLK,
    input D,
    input RESET_B,
    output Q,
    output Q_N
);
    sky130_fd_sc_hd__dlrbp_1 _TECHMAP_REPLACE_
    (
        .RESET_B(RESET_B),
        .D(D),
        .GATE(CLK),
        .Q(Q),
        .Q_N(Q_N)
    );
endmodule

module sky130_fd_sc_hd__dfxbp_1
(
    input CLK,
    input D,
    output Q,
    output Q_N
);
    sky130_fd_sc_hd__dlxbp_1 _TECHMAP_REPLACE_
    (
        .D(D),
        .GATE(CLK),
        .Q(Q),
        .Q_N(Q_N)
    );
endmodule

module sky130_fd_sc_hd__dfsbp_2
(
    input CLK,
    input D,
    input SET_B,
    output Q,
    output Q_N
);
    // Similarly, the SKY130 PDK doesn't have a latch with asynchronous set and complementary
    // outputs, so we need to create one here
    wire temp_Q;

    wire D_or_set, gate_or_set;
    assign D_or_set = D || ~SET_B;
    assign gate_or_set = CLK || ~SET_B;

    sky130_fd_sc_hd__dlxtp_2 _TECHMAP_REPLACE_ (
        .D(D_or_set),
        .GATE(gate_or_set),
        .Q(temp_Q)
    );    

    assign Q = temp_Q;
    assign Q_N = ~temp_Q;

endmodule