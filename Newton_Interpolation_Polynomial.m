format long

stamp_value = [2 3 2 3 4 5 6 8 10 15 18 20 22 25 29 32 33 34];
year = [1885 1917 1917 1932 1958 1963 1968 1971 1974 1978 1981+(1/4) 1987+(3/4) 1985 1988 1991 1995 1999 2001];

temp = [];
output = [];

output(end + 1) = year(1);

for i = 1 : (length(year) - 1)
    for j = 1 : (length(year) - 1);

        if (stamp_value(i + j) - stamp_value(j)) ~= 0
            value = (year(j + 1) - year(j)) / (stamp_value(j + i) - stamp_value(j));
            temp(end + 1) = value;
        end

        if (stamp_value(j + i) - stamp_value(j)) == 0
            temp(end + 1) = 0
        end

    end

    if (length(temp)) ~= 0
        output(end + 1) = temp(1);
        year = temp;
        temp = [];
    end

end

syms x;

y = stamp_value(1) + output(1);
temp_1 = 1;

for i = 1 : (length(stamp_value) - 1)
    for j = 1 : i

        temp_1 = temp_1 * (x - stamp_value(j));

    end

    y = y + temp_1 * output(i + 1);
    temp_1;

end

simplify(y)
            
