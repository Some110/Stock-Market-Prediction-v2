function plotpartitions(close,A,Al,Au)
    numFS=unique(A);  % converting the close series into a matrix
    FS=zeros(length(numFS),length(close));
    for i=1:length(A)
        FS(A(i),i)=close(i);
    end

    % Plot Input Close
    plot(close,'k*-');
    hold on;
    for i=1:length(numFS)
        part=Al+(i-1)*200;
        plot([1 length(close)],[part part],'k:');
        hold on;
    end
    hold off;
    axis([1 length(close) Al Au]);
    xlabel('Training days');
    ylabel('Close');
    title('Fuzzifying training data');
    %
end