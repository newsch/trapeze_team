function res = compiler_n_plotter(A, L, X2, Y2)
% Assuming :
%     A = Angle in radians
%     L = Magnitude of Position Vector (in m)
%     X2 = X position After release (in m)
%     Y2 = Y position After release (in m)

n = length(A)-1;
X1 = zeros(n,1);
Y1 = zeros(n,1);

%Converting From Polar
for i = 1:n
    X1(i) = L(i) * (cos((A(i)+pi/2))); 
    Y1(i) = L(i) * (-sin((A(i)+pi/2)));
end

%combining pre and post release positions
X = [X1 ; X2];
Y = [Y1 ; Y2];

comet(X,Y);

clf

plot(X,Y);
xlim([-2 2]);
ylim([-2 2]);

xlabel('Horizontal Position (in m)')
ylabel('Vertical postion (in m)')

% Testing values used by Colvin
%    A = pi * [2;2.3;2.5;2.7;2.8];
%    L = [3;3;3;3;3];
%    X2 = [3;4;5];
%    Y2 = [-.2;0;-3];
end