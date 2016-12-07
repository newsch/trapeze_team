function energy_tester(vX1,vY1,vx,vy,times,times1,m,y)
vX = vX1.';
vY = vY1.';

ynew = 20 + y(2:length(y));

Times = times.';

Vx = [vX ; vx];
Vy = [vY ; vy];

t = [Times ; times1];
V = sqrt(Vx.^2 + Vy.^2);

KE = 1/2 * m * V.^2;
PE = m*9.81*ynew;
E = KE + PE;

tnew = t(3:length(t));

hold on
plot(tnew , E)
plot(tnew, KE)
plot(tnew, PE)
xlabel('Time (s)')
ylabel('Energy (j)')
legend({'Total Energy','Kinetic Energy','Potential Energy'},'FontSize',12);
end