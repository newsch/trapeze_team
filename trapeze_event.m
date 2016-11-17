function [position,isterminal,direction] = trapeze_event(t, y)
    position = 1-t;
    isterminal = 0;
    direction = 0;
    released = 1;
end