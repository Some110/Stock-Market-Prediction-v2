function FLRG=tableVI(B,fromA,toA) % b is partitions of variation ,A is partitions of mf (for all days)
    
    endA=max([max(fromA),max(toA)]);         %  (step 5.5)grouping fuzzy logical relationships
                                             %  Step5.5:Based on the linguistic terms of the fuzzy variations obtainedinStep5.3,groupthe
                                       %  fuzzy logical relationships having the same linguistic term of the fuzzy variation into a FLRG.
                                             %  For example, assume that the following fuzzy logical relationships exist: Aa1 ? Aaa, 
                                             %  where the fuzzy variation of the main factor on trading day p is Bz;
                                             %  4 IEEE TRANSACTIONS ON FUZZY SYSTEMS, VOL. 19, NO. 1, FEBRUARY 2011
                                            %   Aa1 ? Aab, where the fuzzy variation of the main factor on trading day q is Bz; Aa1 ? Aac, 
                                            %   where the fuzzy variation of the main factor on trading day r is Bz; . . . Aa1 ? Aak, where the 
                                            %   fuzzy variation of the main factor on trading day t is Bz. Then, these fuzzy logical relationships 
                                            %   can be grouped together into the FLRG “Group Bz”, which is shown as follow   
    FLRG=zeros(endA,endA,14);

    temp=zeros(endA,endA,14);
    for i=1:length(B)
        temp(fromA(i),toA(i),B(i))=1;
        FLRG=FLRG+temp;
        temp=zeros(endA,endA,14);
    end
    
end