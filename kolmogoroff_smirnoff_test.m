clear
close all
n_trials = 10^3;
n = 10^2;

f = @(t) normcdf(t,0,1);

kolm = zeros(1,n_trials);
for k = 1:n_trials
    data = normrnd(0,1,1,n);

%     x = sort(data);
% 
%     D = 0;
%     for i = 1:n
%         temp = max(i/n - f(x(i)),f(x(i)) - (i-1)/n);
%         if D < temp
%             D = temp;
%         end
%     end
%     kolm(k) = D*sqrt(n);
    kolm(k) = kolmogoroff_smirnoff( data, f );
end
kolm = sort(kolm);
q = kolm(900)
hist(kolm,15)