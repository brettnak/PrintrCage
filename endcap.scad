// endcap
releif=2;
pipe_width=22.0;
pipe_radius = pipe_width / 2.0;
offset=2;

difference() {
  cylinder( h = 7, r = pipe_radius + offset);

  translate([0,0,2])
  cylinder( h = 6, r = pipe_radius);
};
