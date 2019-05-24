function forcasting = predicting(closeMF,A,VarSF,BSF,FVG,WBS,FLRG,Al,e1)

    forcast=zeros(89,1);
  
    
   
    
    for i=e1:260
         c=1;
         cc=0;
       flr=zeros(2,9);
       fuzyA=A(i-1,1);                              %finding corresponding fuzzy set and fuzzy variation group for day t-1
       fuzyB=BSF(i-1,1);
       relations=FLRG(fuzyA,:,fuzyB);               % getting all fuzzy logical relations in the corresponding fuzzy variation group of day t-1
       weights=WBS(fuzyB,:);                        %   getting weights of corresponding  fuzzy variation group 
       
       sit=sum(relations(:));                        %summing all the relations
       
       if (sit==0)
           
           
            forcast(i,1)=(Al+((fuzyA-1)*200))+100;      %forecasting for situation 2
           
       elseif (sit~=0)                                      %else forecasting for situation 1
       
       for j=1:9
           if relations(j)>0
               flr(1,c)=j;                             %loading all fuzzing relation into flr 
               flr(2,c)=relations(j);                  %loading repetations of relations
               c=c+1;
           end
           
       end
       
       c=c-1;
      
       mmm=zeros(1,3,c);
       sump=zeros(1,c);
       wtvalues=zeros(1,c);
       
         
     
       for j=1:c
           mmm(1,1,j)=Al+((flr(1,j)-1)*200);            %finding leftmost , middle and rightmost point in the corresponding intervals
           mmm(1,3,j)=Al+(flr(1,j)*200);
           mmm(1,2,j)=(Al+((flr(1,j)-1)*200))+100;
           
       end   
       
      for j=1:c
           mmm(1,1,j)= mmm(1,1,j)*weights(1);
           mmm(1,2,j)= mmm(1,2,j)*weights(2);           %multiplying the weights to the leftmost , middle and rightmost points of the interval
           mmm(1,3,j)= mmm(1,3,j)*weights(3);  
      end
      
       for j=1:c
           sump(1,j)=sum(mmm(1,:,j));                   %find the weighted value of each interval ua
       end
       
       for j=1:c
        wtvalues(1,j)= sump(1,j)*flr(2,j);                 %multiplying the intervals with the number of times their fuzzy sets occur in the FLRGs 
       end
       
       for j=1:c
           cc=cc+flr(2,j);                                  %finding total number of fuzzy sets in FLRGS ,total number of times they exist
       end
       
       
     
      forcast(i,1)=(sum(wtvalues(1,:)))/cc;                 %diving the sum with cc to get the forecasted value
      
       end
     
       
        
    end
    forcasting=forcast;
    
   




end

