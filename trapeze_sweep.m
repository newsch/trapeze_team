function res = trapeze_sweep(s_ang,l_time)
L = zeros(l_time/0.01,1);
S = zeros(l_time/0.01,1);
for u=3:1:s_ang
    for s=0.03:0.01:l_time
        [p,launch_ang(round(s*100)),success(round(s*100))] = flow_event_test_two(u,s,@flows_polar,@released_flow);
    end
    launch_ang = launch_ang.';
    success = success.';
    S = [S success];
    L = [L launch_ang];
    [start_ang(u),p,p] = flow_event_test_two(u,s,@flows_polar,@released_flow);
    launch_ang = [];
    success = [];
end
start_ang = start_ang(2:length(start_ang));
start_ang = start_ang.';
L = L.';
start_ang = start_ang./0.0174533;
L = L./-0.0174533;
for x=1:s_ang-3
    for y=1:l_time/0.01
        if(S(y,x) == 1)
            hold on
            scatter(start_ang(x,1),L(x,y),1,[0 0 0]);
        end
    end
end
end