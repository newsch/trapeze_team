function res = released_flow(~, pos_vel_vector)
% RELEASED_FLOW  Flows for after the person has released.
% Air resistance is not currently taken into account.
    %% Unpack input vector
    input_cell = num2cell(pos_vel_vector);
    [x, y, vx, vy] = deal(input_cell{:});
    
    %% Constants
    g_accel = 9.8;     % gravitational accelaration, in m/s^2
    air_density = 1.2; % air density, in kg/m^3
%     drag_coeff = ;  % coefficient of drag, unitless
%     cs_area = ;   % cross sectional area of person, in m^2
    mass = 80;      % average mass of person, in kg  

    %% Equations
    % unit vectors
    v_mag = sqrt(vx^2 + vy^2);
    uvx = vx / v_mag;
    uvy = vy / v_mag;
    
    %% forces
    f_gravity = -mass * g_accel;
    
    fx = 0;
    fy = f_gravity;
    
%     f_air = -0.5 * air_density * drag_coeff * cs_area * (vx^2 + vy^2);
%     fx = fx + f_air * uvx;
%     fy = fy + f_air * uvy;

    %% velocities 
    dxdt = vx;
    dydt = vy;

    %% acceleration
    dvxdt = fx / mass;
    dvydt = fy / mass;

    %% Pack output vector
    res = [dxdt; dydt; dvxdt; dvydt];
end