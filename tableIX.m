%FVG=tableIX(B(2:e1),BSF(2:e1));
function FVG=tableIX(B_MF,B_SF)
    
    FVG=zeros(14,14);
    temp=zeros(14,14);
    
    for t=2:length(B_MF)
        Bx=B_MF(t);
        Bz=B_SF(t-1);
        temp(Bz,Bx)=1;          %  (step 6.4) Construct fuzzy variation groups described as follows. Based on the fuzzy variations of the secondary factor of 
                                %   the trading days obtained in Step 6.3, if the fuzzy variation of the main factor of trading day t is Bx and the fuzzy 
                                %   variation of the secondary factor on trading day t?1 is Bs, then put the fuzzyvariation“Bx”ofthemainfactoroftradingday t into
                                %   the fuzzy variation group “Group Bs
        FVG=FVG+temp;           %   constructing fuzzy variation groups ,if fuzzy variation of mf on day t is bx and sf of t-1 is bz then bx is grouped into bz 
        temp=zeros(14,14);
    end
    
end