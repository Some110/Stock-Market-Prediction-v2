function [CFE,ME,MSE,RMSE,SD,MAD,MAPE]=errormetrics(predicted,TestCP)
    CFE=sum(TestCP-predicted);
%     disp('CFE=');
%     disp(CFE);
    ME=mean(TestCP-predicted);
%     disp('ME=');
%     disp(ME);
    MSE=mean((TestCP-predicted).^2);
%     disp('MSE=');
%     disp(MSE);
    RMSE=sqrt(MSE);
%     disp('RMSE=');
%     disp(RMSE);
    SD=std(TestCP-predicted);
%     disp('SD=');
%     disp(SD);
    MAD=mean(abs(TestCP-predicted));
%     disp('MAD=');
%     disp(MAD);
    MAPE=mean(abs(TestCP-predicted)./TestCP)*100;
%     disp('MAPE=');
%     disp(MAPE);
end