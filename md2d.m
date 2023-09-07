clear all
clc

Height = [];
Distance = [];
kill = [];
for i = 5:0.5:15
    height = i*100;
    for j= 5:0.5:20
        d = j*100;
        sim("DACS.slx")
        Height = [Height, height];
        Distance = [Distance, d];
        kill = [kill, abs(norm(TPOS.Data(:,end-2)) - norm(POSITION.Data(end-2,:))) < 5];
    end
end

gscatter(Height, Distance, kill, "br", "xo")
ylim([450 2050])
xlabel("Flight distance [km]")
ylabel("Maximum height [km]")
grid on
legend("Miss distance \geq 5", "Miss distance < 5")