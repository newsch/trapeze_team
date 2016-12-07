function [start_angle,launch_angle,success] = flow_event_test_two(starting_angle, sim_time, flow_handle1, flow_handle2, events_handle)
% FLOW_EVENT_TEST  plots animation of swinging pendulum in polar coordinates
% events_handle is optional.
    
    success = 0;
    step_size = 0.005;

    switch nargin
    case 5
      use_events = true;
    otherwise
      use_events = false;
    end

    times = step_size*2:step_size:sim_time;
    
    init_values = [starting_angle*0.0174533, 1, 0, 0]; % position, [Angle (radians), Length (m), dA, dL]
    
    if use_events
        options = odeset('Events', events_handle);
        output = ode5(flow_handle1, times, init_values, options);
    else
        output = ode5(flow_handle1, times, init_values);
    end
    
    A = output(:,1);
    L = output(:,2);
    start_angle = A(1);
    launch_angle = A(end);
    for i=1:size(A)-1
        X(i) = L(i)*(-sin(A(i)));
        Y(i) = L(i)*(-cos(A(i)));
    end
    for i=1:size(A)-1
        w = size(A);
        if(i>1)
            if(i<(w(1)-1))
                vX(i) = (X(i+1) - X(i))*(1/step_size);
                vY(i) = (Y(i+1) - Y(i))*(1/step_size);
            end
        end
    end
    
    mid_values = [X(end),Y(end),vX(end),vY(end)];
    
    [times1, output1] = ode45(flow_handle2, [sim_time sim_time+2], mid_values);
    
    Xfin = output1(:,1);
    Yfin = output1(:,2);
    
    %comet(X,Y);
    %polar(A-pi/2,L);
    %comet(A,L);
    %plot(Xfin,Yfin);
    
    [Xoutput, Youtput] = compiler_n_plotter(A,L,Xfin,Yfin);
    
    for q = 1:length(Xoutput)
        if(abs(Xoutput(q) - 2) < 0.5)
            if(abs(Youtput(q) + 2) < 0.5)
                success = 1;
                break
            end
        end
    end
    
    %energy_tester(vX,vY,output1(:,3),output1(:,4),times,times1,80,Yout);
    
end