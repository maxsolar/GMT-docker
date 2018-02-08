#!/usr/bin/env bash
# reference: http://gmt.soest.hawaii.edu/doc/5.4.3/pdf/GMT_Tutorial.pdf

echo tutorial 01..
godr gmt psbasemap -R10/70/-3/8 -JX4i/3i -Ba -B+glightred+t"My first plot" -P > GMT5_tut_1.ps
echo tutorial 02..
godr gmt psbasemap -R1/10000/1e20/1e25 -JX9il/6il -Bxa2+l"Wavelength (m)" -Bya1pf3+l"Power (W)" -BWS > GMT5_tut_2.ps
echo tutorial 03..
godr gmt pscoast -R-90/-70/0/20 -JM6i -P -Ba -Gchocolate > GMT5_tut_3.ps
echo tutorial 04..
godr gmt pscoast -R-130/-70/24/52 -JB-100/35/33/45/6i -Ba -B+t"Conic Projection" -N1/thickest -N2/thinnest -A500 -Ggray -Wthinnest -P > GMT5_tut_4.ps
echo tutorial 05..
godr gmt pscoast -Rg -JG280/30/6i -Bag -Dc -A5000 -Gwhite -SDarkTurquoise -P > GMT5_tut_5.ps
echo tutorial 06..
godr gmt pscoast -Rg -JKs180/9i -Bag -Dc -A5000 -Gchocolate -SDarkTurquoise -Wthinnest > GMT5_tut_6.ps
echo tutorial 07..
godr gmt psxy @tut_data.txt -R0/6/0/6 -Jx1i -P -Baf -Wthinner > GMT5_tut_7.ps
echo tutorial 08..
godr gmt psxy @tut_data.txt -R0/6/0/6 -Jx1i -Baf -P -K -Wthinner > GMT5_tut_8.ps
godr gmt psxy tut_data.txt -R -J -O -W -Si0.2i >> GMT5_tut_8.ps
echo tutorial 09..
godr gmt makecpt -Cred,green,blue -T0,70,300,10000 > quakes.cpt
godr gmt pscoast -R130/150/35/50 -JM6i -B5 -P -Ggray -K > GMT5_tut_9.ps
godr gmt psxy -R -J -O @tut_quakes.ngdc -Wfaint -i4,3,5,6s0.1 -h3 -Scc -Cquakes.cpt >> GMT5_tut_9.ps
echo tutorial 10..
godr gmt grdcontour @tut_bathy.nc -JM7i -C250 -A1000 -P -Ba > GMT5_tut_10.ps
echo tutorial 11..
godr gmt nearneighbor -R245/255/20/30 -I5m -S40k -Gship.nc -V @tut_ship.xyz
godr gmt grdcontour ship.nc -JM6i -P -Ba -C250 -A1000 > GMT5_tut_11.ps
echo Tutorial tests are done.
