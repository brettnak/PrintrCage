include <pvc_params.scad>;

releif     = 2;
offset     = 1;
slot_depth = pipe_slot_diameter;

pipe_opening = pipe_slot_diameter;
pipe_opening_radius = pipe_slot_radius;

module slot(xrot, yrot, zrot) {
  rotate([xrot, yrot, zrot])
  cylinder( h = slot_depth + 1, r = pipe_opening_radius );
};

difference() {
  cube(pipe_slot_diameter + slot_depth + releif);

  // slots
  translate([
    releif + pipe_slot_diameter + offset,
    releif + ( pipe_slot_radius ),
    releif + ( pipe_opening_radius )
  ])
    slot(0, 90, 0);

  translate([
    releif + ( pipe_opening_radius ),
    releif + ( pipe_opening_radius ),
    releif + pipe_slot_diameter + offset
  ])
    slot(0,0,0);

  translate([
    releif + ( pipe_opening_radius ),
    releif + pipe_slot_diameter + offset,
    releif + (pipe_opening_radius),

  ])
    slot(-90,0,0);

  // Main cuts
  translate([
    releif * 2 + pipe_slot_diameter,
    releif * 2 + pipe_slot_diameter,
    -1
  ])
  cube( pipe_slot_diameter * 4 + 1, pipe_slot_diameter );

  translate([
    releif * 2 + pipe_slot_diameter,
    -1,
    releif * 2 + pipe_slot_diameter
  ])
  cube( pipe_slot_diameter * 4 + 1, pipe_slot_diameter );

  translate([
    -1,
    releif * 2 + pipe_slot_diameter,
    releif * 2 + pipe_slot_diameter
  ])
  cube( pipe_slot_diameter * 4 + 1, pipe_slot_diameter );

}
