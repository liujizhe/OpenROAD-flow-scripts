source $::env(SCRIPTS_DIR)/load.tcl
load_design 3_1_place_gp_skip_io.odb 2_floorplan.sdc

if {[info exists ::env(FLOORPLAN_DEF)]} {
    puts "Skipping IO placement as DEF file was used to initialize floorplan."
} else {
  if {[info exists ::env(IO_CONSTRAINTS)]} {
    source $::env(IO_CONSTRAINTS)
  }
  place_pins -hor_layer $::env(IO_PLACER_H) \
           -ver_layer $::env(IO_PLACER_V) \
           {*}$::env(PLACE_PINS_ARGS)
}

write_db $::env(RESULTS_DIR)/3_2_place_iop.odb
