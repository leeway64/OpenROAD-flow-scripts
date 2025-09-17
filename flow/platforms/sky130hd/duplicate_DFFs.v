// This file duplicates each DFF, and also adds extra flip-flops to make sure that each enable and
// reset are clocked by the correct clock (i.e., clock 1 goes to clock 2, clock 2 goes to clock 1).

module \$_DFFE_PP_ (input D, C, E, output Q);
    wire FF_connector;
    \$_DFFE_PP_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .E(E), .Q(FF_connector));
    wire enable_FF_output;
    \$_DFF_P_ enable_FF (.D(E), .C(C), .Q(enable_FF_output));
    \$_DFFE_PP_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(FF_connector), .C(C), .E(enable_FF_output), .Q(Q));
endmodule

module \$_DFF_P_ (input D, C, output Q);
    wire connector;
    \$_DFF_P_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .Q(connector));
    \$_DFF_P_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .Q(Q));
endmodule

module \$_SDFFE_PN0P_ (input D, C, R, E, output Q);
    wire connector;
    \$_SDFFE_PN0P_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .R(R), .E(E), .Q(connector));
    \$_SDFFE_PN0P_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .R(R), .E(E), .Q(Q));
endmodule

module \$_SDFFE_PP0P_ (input D, C, R, E, output Q);
    wire connector;
    \$_SDFFE_PP0P_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .R(R), .E(E), .Q(connector));
    \$_SDFFE_PP0P_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .R(R), .E(E), .Q(Q));
endmodule

module \$_SDFF_PP0_ (input D, C, R, output Q);
    wire connector;
    \$_SDFF_PP0_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .R(R), .Q(connector));
    \$_SDFF_PP0_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .R(R), .Q(Q));
endmodule

module \$_SDFF_PP1_ (input D, C, R, output Q);
    wire connector;
    \$_SDFF_PP1_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .R(R), .Q(connector));
    \$_SDFF_PP1_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .R(R), .Q(Q));
endmodule

module \$_DFFE_PP0P_ (input D, C, R, E, output Q);
    wire connector;
    \$_DFFE_PP0P_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .R(R), .E(E), .Q(connector));
    \$_DFFE_PP0P_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .R(R), .E(E), .Q(Q));
endmodule

module \$_DFF_PP0_ (input D, C, R, output Q);
    wire connector;
    \$_DFF_PP0_ _TECHMAP_REPLACE_.custom_FF_replace_1 (.D(D), .C(C), .R(R), .Q(connector));
    \$_DFF_PP0_ _TECHMAP_REPLACE_.custom_FF_replace_2 (.D(connector), .C(C), .R(R), .Q(Q));
endmodule