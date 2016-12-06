function energy_tester(vX1,vY1,vx,vy,times,times1,m)
vX = vX1.';
vY = vY1.';
Times = times.';

Vx = [vX ; vx];
Vy = [vY ; vy];

t = [Times ; times1];
V = sqrt(Vx.^2 + Vy.^2);

KE = 1/2 * m * V.^2;
PE = m*9.81* 20 ;
E = KE + PE;
 
comet(t , E)
xlabel('Time (s)')

ylabel('Energy (j)') 

ylabel('Energy (j)')
end

