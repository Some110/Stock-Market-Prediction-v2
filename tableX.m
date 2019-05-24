function BS=tableX(FVG)
    
    BS=zeros(14,3);

    for i=1:14
        if sum(FVG(i,:))~=0
            BS(i,1)=sum(FVG(i,1:i-1))/sum(FVG(i,:));    %  (step 7)for each fuzzy variation group Bz we calculate Bz1 ,Bz2,Bz3  
                                                        %  Step 7: For each fuzzy variation group “Group Bs” obtained in Step 6.4, 
                                                        %  calculate the weights WBs1,WBs2, and WBs3 of BS,1,BS,2, and BS,3, respectively, which is shown
                                                        %   as follows
                                                        %   WBs,k = Bs,k/ (Bs,1 + Bs,2 + Bs,3)

            BS(i,2)=FVG(i,i)/sum(FVG(i,:));
            BS(i,3)=sum(FVG(i,i+1:14))/sum(FVG(i,:));
        end
    end
    
end