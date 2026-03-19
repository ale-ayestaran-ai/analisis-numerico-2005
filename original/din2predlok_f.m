function f = f(t,r,n,K,q,p,tipo,C,h)
switch tipo
    case 10
        f=r*n*(1-(n/K)^q)-C*n*p;
    case 20
        f=r*n*(1-(n/K)^q)-C*n/(1+C*h*n)*p;
    case 30
        f=r*n*(1-(n/K)^q)-C*n^2/(1+C*h*n^2)*p;
end
