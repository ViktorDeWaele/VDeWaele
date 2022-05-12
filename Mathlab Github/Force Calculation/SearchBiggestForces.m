MaxForce = 0;

for q = 1:size(B)

ForcesComb = abs(B(q,1))+abs(B(q,2))+abs(B(q,3))+abs(B(q,4))+abs(B(q,5))+abs(B(q,6));    
    
    if  ForcesComb > MaxForce
        MaxForce = ForcesComb;
        disp(B(q,:));
    end
    
end
