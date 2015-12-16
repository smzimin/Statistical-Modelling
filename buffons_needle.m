l = 1;
n_trials = 10;
n_throws = 10^5;

temp = 0;
for i = 1:n_trials
    counter = 0;
    for k = 1:n_throws
        angle = pi*rand;
        x = l*rand;
        if floor(x) ~= floor(x+l*sin(angle))
            counter = counter + 1;
        end
    end
    temp = temp + counter / n_throws;
end

res = temp / n_trials
err = abs(res - 2/pi)