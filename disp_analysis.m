function [ t1, t2, SSa, SSb, SSe ] = disp_analysis( Y )
t = size(Y,1);
b = size(Y,2);

SSa = b*sum( (mean(Y,2)-mean(Y(:))).^2 );
SSb = t*sum( (mean(Y,1)-mean(Y(:))).^2 );

T = Y - repmat(mean(Y,1),t,1) - repmat(mean(Y,2),1,b) + mean(Y(:));

SSe = sum( T(:).^2 );

t1 = SSa*(b-1)/SSe;
t2 = SSb*(t-1)/SSe;

[t1 finv(0.9,t-1,(t-1)*(b-1))]
[t2 finv(0.9,b-1,(t-1)*(b-1))]
end