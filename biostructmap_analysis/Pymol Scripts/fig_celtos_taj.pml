## Finalize wattersons pictures

# background white and alphachecker off
bg_color white
set ray_opaque_background, off

load ../tajima_d_models/celtos_norsa_trim_tajima.pdb
load ../tajima_d_models/help_scale.pdb

# set view (orient + zoom center, 60)
set_view (\
    -0.555667996,    0.425812721,   -0.714084566,\
     0.145033970,    0.895365655,    0.421052814,\
     0.818656385,    0.130399033,   -0.559283316,\
     0.000000000,    0.000000000, -340.276916504,\
    -7.038619995,    4.020566940,    1.632442474,\
   268.276916504,  412.276916504,  -20.000000000 )

# run quick_color2
as surface

# turn off help_scale
hide everything, help_scale

#Select all residues with a mapped data value. Can change the default 'no-value'
#option when writing to pdb b factor using biostructmap if needed.
select nonzeros, b < 0 | b > 0

color grey

spectrum b, blue_white_magenta, selection="nonzeros"

# Taking picture
unset specular
set ray_trace_gain, 1
set ray_trace_mode, 0
bg_color white
set ray_trace_color, black
unset depth_cue
set antialias, 2
set ambient, 0.2
set direct, 0.9

png ../Pymol Figures/celtos_taj1.png, width=800, height=800, dpi=800, ray=1

rotate y, 180

png ../Pymol Figures/celtos_taj2.png, width=800, height=800, dpi=800, ray=1