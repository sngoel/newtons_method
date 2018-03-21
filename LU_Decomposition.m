function [Lower, Upper, Pivot] = LU_Decomposition(A)
 
[n, n] = size(A);
Lower = eye(n); Pivot = Lower; Upper = A;

for i = 1 : n
    [pivot y] = max(abs(Upper(i : n, i)));
    y = y + i - 1;

    if y ~= i
        Temp = Upper(i, : );
        Upper(i, : ) = Upper(y, : );
        Upper(y, : ) = Temp;
        Temp = Pivot(i, : );
        Pivot(i,:) = Pivot(y, : );
        Pivot(y,:) = Temp;

        if i >= 2
            Temp = Lower(i,1:i-1);
            Lower(i,1:i-1) = Lower(y,1:i-1);
            Lower(y,1:i-1) = Temp;
        end

    end

    for j = i + 1 : n
        Lower(j, i) = Upper(j, i) / Upper(i, i);
        Upper(j, : ) = Upper(j, : )-Lower(j, i) * Upper(i, : );
    end

end