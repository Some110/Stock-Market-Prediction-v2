clear all;
clc;
%str=input('Data file having Main Factor:');
str='TAI2004.mat';
load(str);
closeMF=close;
%n=input('Number of secondary factors:');
n='2';
n=str2double(n);
SF=zeros(length(closeMF),n);
for i=1:n
    %strSF=input(['Data file having ',num2str(i),'-th Secondary Factor:']);
    if (i==1)
        strSF='NAS2004.mat';
    end
    if(i==2)
        strSF='DOW2004.mat';
    end
    
                                     
                                %loading .mat files,
    load(strSF);
    SF(:,i)=close;          %storing close variable of .mat files in a matrix 'SF'
end
clear close;
tic;
%% Training
[A,B,VarMF,Au,Al]=partitioning(closeMF);
%plotpartitions(closeMF(s:e1),A(s:e1),Al,Au);
FLRG=tableVI(B(2:e1),A(1:e1-1),A(2:e1));

VarSF=overallvar(VarMF,SF,e1,n);
BSF=fuzzyvarSF(VarSF);
FVG=tableIX(B(2:e1),BSF(2:e1));
WBS=tableX(FVG);

forc1= predicting(closeMF,A,VarSF,BSF,FVG,WBS,FLRG,Al,e1);

forc2=predicting3(closeMF,A,VarSF,BSF,FVG,WBS,FLRG,Al,e1);

[CFE,ME,MSE,RMSE,SD,MAD,MAPE]=errormetrics(forc1(e1+1:260),closeMF(e1+1:260));
disp('according to paper');
disp(RMSE);

plotforecasted(forc1(e1+1:260),closeMF(e1+1:260),RMSE);

[CFE,ME,MSE,RMSE,SD,MAD,MAPE]=errormetrics(forc2(e1+1:260),closeMF(e1+1:260));
disp('according to method 2');
disp(RMSE);




figure,
plotforecasted(forc2(e1+1:260),closeMF(e1+1:260),RMSE);






