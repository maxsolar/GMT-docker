#!/usr/bin/env bash
# reference: http://gmt.soest.hawaii.edu/gmt4/

echo tutorial 01..
godr psbasemap -R1/10000/1e20/1e25 -JX9il/6il -B2:\~Wavelength\ \(m\)\~:/a1pf3:~Power\ \(W\)\~:WS > GMT4_tut_01.ps
echo tutorial 02..
godr pscoast -R-90/-70/0/20 -JM6i -P -B5g5 -Gchocolate > GMT4_tut_02.ps
echo tutorial 03..
godr blockmedian -R245/255/20/30 -I5m -V ship.xyz > ship_5m.xyz
godr surface ship_5m.xyz -R245/255/20/30 -I5m -Gship.nc -V
godr psmask -R245/255/20/30 -I5m ship_5m.xyz -JM6i -B2 -P -K -V > GMT4_tut_03.ps
godr grdcontour ship.nc -J -O -K -C250 -A1000 >> GMT4_tut_03.ps
godr psmask -C -O >> GMT4_tut_03.ps
echo tutorial 04..
godr makecpt -Crainbow -T-20/60/10 > disc.cpt
godr makecpt -Crainbow -T-20/60/10 -Z > cont.cpt
godr psbasemap -R0/8.5/0/11 -Jx1i -P -B0 -K > GMT4_tut_04.ps  
godr psscale -D3i/3i/4i/0.5ih -Cdisc.cpt -B:discrete: -O -K >> GMT4_tut_04.ps  
godr psscale -D3i/5i/4i/0.5ih -Ccont.cpt -B:continuous: -O -K >> GMT4_tut_04.ps  
godr psscale -D3i/7i/4i/0.5ih -Cdisc.cpt -B:discrete: -I0.5 -O -K >> GMT4_tut_04.ps  
godr psscale -D3i/9i/4i/0.5ih -Ccont.cpt -B:continuous: -I0.5 -O >> GMT4_tut_04.ps

echo Tutorial tests are done.
