function energy_tester(vX,vY,vx,vy,times,times1,m)
Vx = [vX ; vx];
Vy = [vY ; vy];

t = [times ; times1];
V = sqrt(Vx.^2 + Vy.^2);

KE = 1/2 * m * V^2;
PE = m*9.81* 20 ;
E = KE + PE;

comet(t , E)
xlabel('Time (s)')
ylabel('Energy (j)')