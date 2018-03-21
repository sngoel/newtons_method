format long

syms x1 x2 x3 x4

f1 = sin(x1) + (x2) - cos(x3) + (x4);
f2 = (x1)^3 - exp(x2) + (x3)^3 - (x4);
f3 = exp(x1) + (x2) - (x3) + sin(x4);
f4 = (x1)^2 - sin(x2) + (x3) - exp(x4);

Func = [f1;f2;f3;f4];
Jacob = jacobian(Func, [x1,x2,x3,x4]);

Func = matlabFunction(Func);
Jacob = matlabFunction(Jacob);

n = 20;
epsilon = 10e-8;

x0 = [1;-0.25;-1;-1.5];
x = x0;

for i = 1:n
    if abs(Func(x(1), x(2), x(3), x(4))) < epsilon
        break
    end
    A = Jacob(x(1), x(2), x(3), x(4));
    B = -1*Func(x(1), x(2), x(3), x(4));
    [Lower, Upper, Pivot] = LU_Decomposition(A);
    Result = Upper \ (Lower \ (Pivot * b));
    x = x + Result
end

Func(x(1), x(2), x(3), x(4))