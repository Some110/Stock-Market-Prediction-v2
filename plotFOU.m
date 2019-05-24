function plotFOU(UMF,LMF,x)
    for i=1:size(UMF,1)
        figure,shadedplot(x,LMF(i,:),UMF(i,:),[0.8 0.8 0.8]);
        xlabel('Close');
        ylabel('Membership values');
        title(['FOU for fuzzy set A', num2str(i)]);
    end
end