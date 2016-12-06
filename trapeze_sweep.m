function res = trapeze_sweep(fin_time)
for s=0.1:0.1:fin_time
    end_output = flow_event_test_two(s,@flows_polar,@released_flow)
end