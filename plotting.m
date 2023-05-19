h1 = animatedline('Color', 'r', 'LineWidth', 3);
h2 = animatedline('Color', 'b', 'LineWidth', 3);
hold on
grid on
xlabel("North");
ylabel("East");
zlabel("Height");
daspect([1 1 1])
view(3)
for k = 1:length(tout)
    addpoints(h1, TPOS.Data(1,k), TPOS.Data(2,k), TPOS.Data(3,k))
    addpoints(h2, POSITION.Data(k,1), POSITION.Data(k,2), POSITION.Data(k,3))
    drawnow
end
%plot3(TPOS.data(1,:),TPOS.data(2,:),TPOS.data(3,:), '-r', 'LineWidth', 4);
%daspect([1 1 1])
%hold on
%grid on
%xlabel("North");
%ylabel("East");
%zlabel("Height");
%plot3(POSITION.Data(:,1), POSITION.Data(:,2), POSITION.Data(:,3), '-b', 'LineWidth', 4);
disp(abs(norm(TPOS.Data(:,end-2)) - norm(POSITION.Data(end-2,:))));

