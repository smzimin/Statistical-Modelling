function w2 = omega_squared( data, f )
x = sort(data);
n = length(x);

w2 = sum((f(x) - (2*(1:n)-1)/2/n).^2) + 1/12/n;

end