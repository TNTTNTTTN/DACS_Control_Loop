hold on
grid on
xlabel("North");
ylabel("East");
zlabel("Height");
h1 = animatedline('Color', [0.4940 0.1840 0.5560], 'LineWidth', 3,'LineStyle' ,'--');
for i = 1:3
    if i==1
        h2 = animatedline('Color', [0 0.4470 0.7410], 'LineWidth', 3);
        d = 500;
    elseif i==2
        h2 = animatedline('Color', [0.9290 0.6940 0.1250], 'LineWidth', 3);
        d = 800;
    else
        h2 = animatedline('Color', [0.8500 0.3250 0.0980], 'LineWidth', 3);
        d = 1000;
    end
    sim("DACS")
    daspect([1 1 1])
    view(3)
    for k = 1:length(tout)
        addpoints(h1, TPOS.Data(1,k), TPOS.Data(2,k), TPOS.Data(3,k))
        addpoints(h2, POSITION.Data(k,1), POSITION.Data(k,2), POSITION.Data(k,3))
        drawnow
    end
    disp(abs(norm(TPOS.Data(:,end-2)) - norm(POSITION.Data(end-2,:))));
end

