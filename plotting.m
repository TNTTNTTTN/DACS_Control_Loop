hold on
grid on
xlabel("North");
ylabel("East");
zlabel("Height");
h1 = animatedline('Color', [0.4940 0.1840 0.5560], 'LineWidth', 3,'LineStyle' ,'--');
for i = 1:3
    if i==1
        h2 = animatedline('Color', [0 0.4470 0.7410], 'LineWidth', 3);
        %theta = 25;
        psi = 25; % degree
    elseif i==2
        h2 = animatedline('Color', [0.9290 0.6940 0.1250], 'LineWidth', 3);
        %theta = 30;
        psi = 30; % degree
    else
        h2 = animatedline('Color', [0.8500 0.3250 0.0980], 'LineWidth', 3);
        %theta = 35;
        psi = 35; % degree
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


%plot3(TPOS.data(1,:),TPOS.data(2,:),TPOS.data(3,:), '-r', 'LineWidth', 4);
%daspect([1 1 1])
%hold on
%grid on
%xlabel("North");
%ylabel("East");
%zlabel("Height");
%plot3(POSITION.Data(:,1), POSITION.Data(:,2), POSITION.Data(:,3), '-b', 'LineWidth', 4);


