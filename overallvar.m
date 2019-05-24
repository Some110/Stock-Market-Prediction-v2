%VarSF=overallvar(VarMF,SF,e1,n);
function VarSF=overallvar(VarMF,SF,e,n)
    %
    VarSF1=zeros(size(SF,1),n);
    for i=1:n
        for j=2:size(SF,1)
            VarSF1(j,i)=(SF(j,i)-SF(j-1,i))*100/SF(j-1,i);    % Step 6.1.1: Calculate the variations of the main factor and the elementary 
                                                              %  secondary factors, respectively. Assume that the main factor is MF and assume that the 
                                                             %  secondary factor is the combination of the elementary secondary factors SF1,SF2,SF3,...,andSFn
                                                             
                                                             
         end
    end
    %
    
    %
    tempDiffer=zeros(e,n);                                     %   Step 6.1.2: Calculate the total different variation Di?erSFi between the variation 
                                                               %    of the main factor MF of trading day t and the variation of the elementary secondary factor
                                                               %    SFi of trading day t?1, 
    for i=1:n
        for j=3:e
            tempDiffer(j,i)=abs(VarSF1(j-1,i)-VarMF(j));        %    step(6.1.2) calculating total different variation of each n secondary factors
        end
    end
    DifferSF=sum(tempDiffer);   %returns row vector
    %
    
    %
    WVSF=zeros(1,n);                             %  initialising a row vector Calculate the weighted variations WVSF1 ,WVSF2 ,WVSF3 , ...,and WVSFn of the elementary secondary factors 
                                                 %  SF1,SF2, SF3,...,and SFn, respectively, WVSFi =(Di?erSF1 +Di?erSF2 +Di?erSF3 +·+Di?erSFn)/DifferSFi
    for i=1:n
        WVSF(i)=sum(DifferSF)/DifferSF(i);        % calculating weighted variations of each n secondary factors
    end
    %
    
    %
    WSF=zeros(1,n);
    for i=1:n
        WSF(i)=WVSF(i)/sum(WVSF);             % (step 6.1.3)calculating normalised weighted of each n secondary factors1
                                              % Step 6.1.3: Get the normalized weighted variations WSF1 , WSF2 ,WSF3 ,...,andWSFn of the elementary secondary 
                                              % factors SF1,SF2,SF3,...,andSFn,
                                              % respectively, where  WSFi =WVSFi/(WVSF1 +WVSF2 +···+WVSFn)


    end
    %
    
    %
    VarSF=zeros(1,size(SF,1));
    for i=1:size(SF,1)                          %   (step 6.2) calculating variation of the secondary factor for each day
                                                %   Calculate the variation of the secondary factor on each trading day of the training data described as follows.
                                                %   Assume that the secondary factor is the combination of the elementary secondary factors SF1,SF2,SF3,...,andSFn. 
                                                %   Assume that the normalized weighted variations of the elementary secondary factors SF1, SF 2, SF 3,...,and SFn are 
                                                %   WSF1 ,WSF2 ,WSF3 , ...,andWSFn ,respectively.Letthevariationsoftheelementary secondary factorsSF1,SF2,SF3,...,andSFn 
                                                %   on trading day t bedenotedbyVarSF1 t ,VarSF2 t ,VarSF3 t ,...,andVarSFn t , respectively.Then,the variation Vart of the secondary factor 
                                                %   on trading day t is calculated as follows: 
                                                %  Vart = VarSF1 t ×WSF1 +VarSF2 t ×WSF2 +VarSF3 t ×WSF3 + ...+VarSFn t ×WSFn
        VarSF(i)=sum(VarSF1(i,:).*WSF);
    end
    %
end