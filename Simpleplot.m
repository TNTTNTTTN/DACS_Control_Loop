plot3(TPOS.data(1,:),TPOS.data(2,:),TPOS.data(3,:), '-r', 'LineWidth', 4);
daspect([1 1 1])
hold on
grid on
xlabel("North");
ylabel("East");
zlabel("Height");
plot3(POSITION.Data(:,1), POSITION.Data(:,2), POSITION.Data(:,3), '-b', 'LineWidth', 4);
disp(abs(norm(TPOS.Data(:,end-2)) - norm(POSITION.Data(end-2,:))));