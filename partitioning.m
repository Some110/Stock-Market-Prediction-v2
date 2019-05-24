function [A,B,Var,Au,Al]=partitioning(CP)
%%
A=zeros(length(CP),1);
B=zeros(length(CP),1);
Var=zeros(length(CP),1);
%%
templ=min(CP);
tempu=max(CP);

if (roundn(templ,2)-templ)>0      % rounding to the nearest 100 
                                  % Step 1: De?ne the universe of discourse U, 
                                  % U =[Dmin?D 1,Dmax + D2], where Dmin and Dmax are the minimum value and 
                                  % the maximum value of the historical training data ofthemainfactor,respectively; 
                                  % D1 and D2 aretwoproperpositive real values to partition the universe of discourse U 
                                  % into n intervals u1, u2, ..., and un of equal length   
    Al=roundn(templ,2)-100;
else
    Al=roundn(templ,2);
end

% if (roundn(tempu,2)-tempu)>0
%     Au=roundn(tempu,2);
% else
%     Au=roundn(tempu,2)+200;
% end
Au=Al;
while(1)
    Au=Au+200;                %calculating the range of the universe of discourse,Au is upper limit Al is lower limit
    if Au>tempu               
        break;
    end
end

nFS=(Au-Al)/200;  %calculating the number of partitions 

for i=1:length(CP) %partioning the close series of main factor
    for j=1:nFS
        if CP(i)>=(j-1)*200+Al && CP(i)<j*200+Al  % (fuzzyfying the historical data (step 3)Step 3: Fuzzify each historical
                                                  % training datum of the main factor int to a fuzzyset de?ned in Step2.
                                                  % If the historical training datum of the main factor of trading day t belongs to
                                                  % ui and the maximum membership value of the fuzzy set Ai occurs atAi occurs at
                                                  % interval ui, where 1?i?n, then the historical training datum of the main factor 
                                                  % of day t is fuzzi?ed into Ai. 
                                                      
            A(i,1)=j;
            break;
        end
    end
end
%%
for i=2:length(CP) % finding the variation of each day and storing it in var matrix (step 5.1):Calculate
                                                          %     the variation of the closing index between the adjacent 
                                                          %     historical training data of the main factor, 
                                                          %     where the variation Vart of trading day t is calculated as follows
        Var(i)=(CP(i)-CP(i-1))*100/CP(i-1);
end

for i=2:length(Var)                                        %    fuzzyfying the var series  Step 5.4: Fuzzify the variation of
                                                           %    the main factor of each trading day of the 
                                                           %    training data into a fuzzy variation represented by a fuzzy set de?ned 
                                                           %    in Step 5.3. If the variation of the main factor of trading day t 
                                                           %    belongs to interval vj, where 1?j ?m, then the variation of the main
                                                           %    factor of trading day t is fuzzi?ed into the fuzzy variation represented by the 
                                                           %    fuzzy set Bj, where 1?j ?m. 
    for j=1:14
        if Var(i)<-6
            B(i)=1;
        elseif Var(i)>=6
            B(i)=14;
        elseif Var(i)>=(j-1)-6 && Var(i)<j-6
            B(i)=j+1;
        end
    end
end
end