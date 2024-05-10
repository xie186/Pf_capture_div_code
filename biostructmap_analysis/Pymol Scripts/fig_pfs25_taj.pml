## Finalize wattersons pictures

# background white and alphachecker off
bg_color white
set ray_opaque_background, off

load ../tajima_d_models/pfs25_norsa_trim_tajima.pdb
load ../tajima_d_models/help_scale.pdb

# set view (orient + zoom center, 60)
set_view (\
     0.887474477,   -0.373842090,    0.269501746,\
    -0.324928582,   -0.092872202,    0.941167474,\
    -0.326818824,   -0.922830939,   -0.203893721,\
     0.000000000,   -0.000000000, -340.276916504,\
     0.265308380,   -1.467590332,   -0.603527069,\
   268.276916504,  412.276916504,  -20.000000000 )
# run quick_color2
as surface

# turn off help_scale2
hide everything, help_scale

#Select all residues with a mapped data value. Can change the default 'no-value'
#option when writing to pdb b factor using biostructmap if needed.
select nonzeros, b < 0 | b > 0

color grey

spectrum b, blue_white_magenta, selection=nonzeros

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

png ../Pymol Figures/pfs25_taj1.png, width=800, height=800, dpi=800, ray=1

rotate y, 180

png ../Pymol Figures/pfs25_taj2.png, width=800, height=800, dpi=800, ray=1