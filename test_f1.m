clear
close all

data = [5303 5543 5451 5412 4655 3340 4361 4326 5891 5148 4381];
data = [data 7004 5793 5073 5807 5848 5513 4309 5554];

%f = @(t) normcdf(t,mean(data),std(data));
f = @(t) normcdf((t-mean(data))/std(data),0,1);

D = kolmogoroff_smirnoff( data, f ) % 0.6315 < 1.16
w2 = omega_squared( data, f ) % 0.0862 < 0.34

%hist(data)