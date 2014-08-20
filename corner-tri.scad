releif=2;
pipe_width=21.4;
pipe_depth=21.4;
offset=1;

module slot(xrot, yrot, zrot) {
  rotate([xrot, yrot, zrot])
  cylinder( h = pipe_width + 1, r = (pipe_width / 2.0 ) );
};

module pipe_wrapper(xrot, yrot, zrot) {
  rotate([xrot, yrot, zrot])
  difference() {
    cylinder( h = pipe_width + releif * 2, r = pipe_width / 2.0 + releif * 20 );
    cylinder( h = pipe_width + releif * 2 + 1, r = pipe_width / 2.0 + releif );
  }
};

difference() {
  cube(pipe_width*2 + releif);

  // slots
  translate([
    releif + pipe_width + offset,
    releif + (pipe_width / 2.0),
    releif + (pipe_width / 2.0)
  ])
    slot(0, 90, 0);

  translate([
    releif + (pipe_width / 2.0),
    releif + (pipe_width / 2.0),
    releif + pipe_width + offset
  ])
    slot(0,0,0);

  translate([
    releif + (pipe_width / 2.0),
    releif + pipe_width + offset,
    releif + (pipe_width / 2.0),

  ])
    slot(-90,0,0);

  // Main cuts
  translate([
    releif * 2 + pipe_width,
    releif * 2 + pipe_width,
    -1
  ])
  cube( pipe_width * 4 + 1, pipe_width );

  translate([
    releif * 2 + pipe_width,
    -1,
    releif * 2 + pipe_width
  ])
  cube( pipe_width * 4 + 1, pipe_width );

  translate([
    -1,
    releif * 2 + pipe_width,
    releif * 2 + pipe_width
  ])
  cube( pipe_width * 4 + 1, pipe_width );

// // round_releifs
// translate([
//   pipe_width / 2 + releif,
//   pipe_width / 2 + releif,
//   pipe_width + releif * 2
// ])
// pipe_wrapper(0, 0, 0);

// // round_releifs
// translate([
//   pipe_width + releif * 2,
//   pipe_width / 2 + releif,
//   pipe_width / 2 + releif,
// ])
// pipe_wrapper(0, 90, 0);

// // round_releifs
// translate([
//   pipe_width / 2 + releif,
//   pipe_width + releif * 2,
//   pipe_width / 2 + releif,
// ])
// pipe_wrapper(-90, 0, 0);
}
