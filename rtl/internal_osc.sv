module internal_osc (
    output logic oscout
);

    OSC #(.FREQ_DIV(3)) osc_inst (.OSCOUT(oscout));

endmodule : internal_osc
