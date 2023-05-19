function Output = Quatmul(a,b)

if (numel(a) == 3)
    aq = [0;a(1);a(2);a(3)];
else
    aq = [a(1);a(2);a(3);a(4)];
end

if (numel(b) == 3)
    bq = [0;b(1);b(2);b(3)];
else
    bq = [b(1);b(2);b(3);b(4)];
end

aqx = [aq(1) -aq(2) -aq(3) -aq(4); aq(2) aq(1) -aq(4) aq(3); aq(3) aq(4) aq(1) -aq(2); aq(4) -aq(3) aq(2) aq(1)];
Output = aqx*bq;
end

