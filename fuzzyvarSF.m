function BSF=fuzzyvarSF(VarSF)
BSF=zeros(length(VarSF),1);
for i=2:length(VarSF)
    for j=1:14                    % (step 6.3)fuzzyfing the variation of secondary factor
                                    %   Fuzzify the variation of the secondary factor on each trading day of the training data obtained in Step 6.2 into
                                    %   a fuzzy variation represented by a fuzzy set de?ned in Step 5.3. If the variation Vars t of the secondary factor of 
                                    %   trading date t belongs to vj, where 1 ? j ? m and m denotes the number of fuzzy sets de?ned in Step 5.3, then the 
                                    %   variation Vars t of the secondary factor of trading day t is fuzzi?ed into a fuzzy variation represented by a fuzzy set Bj,
                                    %   where 1?j ?m. 
        if VarSF(i)<-6
            BSF(i)=1;
        elseif VarSF(i)>=6
            BSF(i)=14;
        elseif VarSF(i)>=(j-1)-6 && VarSF(i)<j-6
            BSF(i)=j+1;
        end
    end
end
end