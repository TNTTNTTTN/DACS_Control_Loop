%plot3(TPOS.data(1,:),TPOS.data(2,:),TPOS.data(3,:), '-r', 'LineWidth', 4);
daspect([1 1 1])
hold on
grid on
xlabel("North");
ylabel("East");
zlabel("Height");
plot3(POSITION.Data(:,1)./1000, POSITION.Data(:,2)./1000, POSITION.Data(:,3)./1000, '-', 'LineWidth', 4);
disp(abs(norm(TPOS.Data(:,end-2)) - norm(POSITION.Data(end-2,:))));

% legend('2km/s Interceptor (miss distance : 0.077m)', '3km/s Interceptor (miss distance : 0.334m)', '4km/s Interceptor (miss distance : 1.162m)', '5km/s Interceptor (miss distance : 121.76m)', '6km/s Interceptor (miss distance : 509.27m)', 'Target trajectory')