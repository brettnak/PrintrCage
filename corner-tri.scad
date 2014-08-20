releif=3;
pipe_width=12.7;
offset=1;

module slot(xrot, yrot, zrot) {
  rotate([xrot, yrot, zrot])
  cylinder( h = pipe_width + 1, r = pipe_width / 2.0);
}

difference() {
  cube(pipe_width*2 + releif);

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
}

