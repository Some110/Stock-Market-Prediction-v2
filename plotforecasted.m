function plotforecasted(predicted,TestCP,RMSE)
figure,
subplot(3,2,[1 2 3 4]);
plot(TestCP,'k*:');
hold on
plot(predicted,'ko-');
ylabel('Close Price');
axis([0 length(TestCP)+5 min(min(predicted),min(TestCP))-1000 max(max(predicted),max(TestCP))+1000]);
hold off
legend('Actual','Predicted','location','SouthEast');
subplot(3,2,[5 6]);
stem(TestCP-predicted,'ko-');
text(27,max(TestCP-predicted)+50,{'RMSE=',RMSE});
axis([0 length(TestCP) min(TestCP-predicted) max(TestCP-predicted)+150]);
xlabel('Testing days');
ylabel('Error');
end