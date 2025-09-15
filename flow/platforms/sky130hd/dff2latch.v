// Refer to these two files for more information on mapping:
//  OpenROAD-flow-scripts/flow/platforms/sky130hd/cells_latch_hd.v
//  $env(PDK_ROOT)/sky130A/libs.tech/openlane/sky130_fd_sc_hd/latch_map.v

// From https://github.com/YosysHQ/yosys/blob/main/techlibs/common/simcells.v:
//      "A positive edge D-type flip-flop with positive polarity enable."
module \$_DFFE_PP_
(
    input D,
    input C,
    input E,
    output Q
);

    wire enable;
    sky130_fd_sc_hd__and2_1 AND (
        .A(C),
        .B(E),
        .X(enable)
    );

    // dlxtp only has a size of 1
    sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (
        .GATE(enable),
        .D(D),
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

module \$_SDFF_PP0_ ()
endmodule

module \$_SDFF_PP1_ ()
endmodule

module \$_DFFE_PP0P_ (input D, C, R, E, output Q);
    sky130_fd_sc_hd__dlrtp_1 _TECHMAP_REPLACE_ (
        .GATE(C && E),
        .RESET_B(!R),
        .D(D),
        .Q(Q)
    );
endmodule

/*
module \$_DFF_PP0_
(
    input,
    output
);
endmodule
*/

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
