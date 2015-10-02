function D = kolmogoroff_smirnoff( data, f )
x = sort(data);
n = length(x);

D = 0;
for i = 1:n
    temp = max(i/n - f(x(i)),f(x(i)) - (i-1)/n);
    if D < temp
        D = temp;
    end
end
D = D*sqrt(n);

end