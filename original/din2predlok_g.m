function f = f(t,g,p,D,n,tipo,C,h)
switch tipo
    case 10
        f=g*p*(C*n-D);
    case 20
        f=g*p*(C*n/(1+C*h*n)-D);
    case 30
        f=g*p*(C*n^2/(1+C*h*n^2)-D);
end
