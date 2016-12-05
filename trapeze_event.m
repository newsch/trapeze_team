function [position,isterminal,direction] = trapeze_event(t, y)
    position = 3-t;
    isterminal = 0;
    direction = 0;
    released = 1;
end