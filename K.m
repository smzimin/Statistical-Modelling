function y = K( x )

y = zeros(size(x));
y(abs(x) < 1) = 3*(1-x(abs(x) < 1).^2)/4;

end

