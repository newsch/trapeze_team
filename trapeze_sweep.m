function res = trapeze_sweep(fin_time)
for s=0.3:0.1:fin_time
    [Xoutfin,Youtfin] = flow_event_test_two(s,@flows_polar,@released_flow);
end
comet(Xoutfin,Youtfin)