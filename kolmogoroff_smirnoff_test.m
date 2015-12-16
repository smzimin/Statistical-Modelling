clear
close all
n_trials = 10^3;
n = 10^2;

f = @(t) normcdf(t,0,1);

kolm = zeros(1,n_trials);
for k = 1:n_trials
    data = normrnd(0,1,1,n);
    kolm(k) = kolmogoroff_smirnoff( data, f );
end
kolm = sort(kolm);
q = kolm(900)
%hist(kolm,15)