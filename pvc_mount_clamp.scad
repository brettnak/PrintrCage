include <pvc_params.scad>
include <screws.scad>

clamp_overhang    = 40.0;
clamp_height      = 20.0;
releif            = 3.0;
flange_width      = 10;
flange_separation = 2.0;

part_length = clamp_overhang + pipe_slot_diameter + releif + flange_width;

module tri_cutaway() {
  rotate([
    0,
    - atan( (clamp_height - releif)/(clamp_overhang - releif)),
    0
    ])
    translate([-1, -1, releif])
      cube(
        size = [
          clamp_overhang + pipe_slot_diameter + releif,
          (pipe_slot_diameter + releif * 2.0) * 2.0,
          clamp_height * 2]);
}

module pipe_slot() {
  translate([
    part_length - releif - pipe_slot_radius - flange_width,
    releif + pipe_slot_radius,
    -1
  ])

    cylinder( h = clamp_height + 2.0, r = pipe_slot_radius );
}

module flange_former() {
  difference() {
    cube( size = [
      pipe_slot_radius + releif + flange_width + 2.0,
      pipe_slot_radius + releif + 2.0,
      clamp_height + 2.0]);

    translate([0,0,-1])
      cylinder(r = pipe_slot_radius + releif, h = clamp_height + 10.0);

    translate([0,-1,-1])
      cube( size = [
        pipe_slot_radius + releif + flange_width + 3.0,
        releif + (flange_separation/2) + 1,
        clamp_height + 50.0
      ]);
  }
}

difference() {
  cube(
    size = [
      part_length,
      pipe_slot_diameter + releif * 2.0,
      clamp_height ],
    center = false);

  tri_cutaway();

  pipe_slot();

  translate([
    clamp_overhang + pipe_slot_radius,
    releif + pipe_slot_radius - (flange_separation / 2.0),
    -1]
  )
    cube( size = [
      pipe_radius + flange_width + releif + 2.0,
      flange_separation,
      clamp_height + 2.0,
      ]);

  translate([pipe_slot_radius + clamp_overhang, (pipe_slot_radius + releif) , -1])
    flange_former();

  translate([pipe_slot_radius + clamp_overhang, (pipe_slot_radius + releif) , -1])
    mirror([0,1,0])
      flange_former();

  translate([
    pipe_slot_diameter + clamp_overhang + releif + (flange_width/2.0),
    -1,
    (clamp_height/2.0)
  ])
    rotate([-90,0,0])
      cylinder( r = m3_slot_radius, h = 500 );
}
