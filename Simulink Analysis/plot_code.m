Rth_jc = 0.5;
Rth_pcb = 4.5;
R_tim = 1.5;
T_ambient = 40;
ambient_t = ones(150,1)*40;
junc_temp = zeros(150,1);
case_temp = zeros(150,1);
heatsink_t = zeros (150,1);
resistance_h= zeros(150,1);

open_system('thermal_model');
for i= 1:1:150
   Rth_heatsink = 0.01*i;      %K/W
    sim('thermal_model');
    resistance_h(i) = Rth_heatsink;
    junc_temp(i)= Tj(51,2);
    case_temp(i) = T_case(51,2);
    heatsink_t (i) = T_heatsink(51,2);
end

plot(resistance_h,junc_temp,resistance_h,case_temp,resistance_h,heatsink_t,resistance_h,ambient_t,'LineWidth',1.5);
grid on;
grid minor;
legend('Tj','T case','T heatsink','T ambient','Location','northeast');
xlabel('Rth(heatsink)K/W');
ylabel('Temperature(Celcius)');
ylim([35 122]);
xlim([0 1.51]);