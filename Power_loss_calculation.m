%Loss Calculation Parameters
Esw_on=41*1e-3;     %J - IGBT's turn-on switching energy per pulse at peak current (Icp, T=125C)
Esw_off=32*1e-3;    %J - IGBT's turn-off switching energy per pulse at peak current (Icp, T=125C)
fsw = 5000;         %Hz - PWM switching frequency for every inverter arm-switch
Icp= 300;           %A - Peak value of sinusoidal output current
Iep= 300;           %A Icp=Iep
Vce_sat=2  ;        %V - IGBT saturation voltage drop @Icp and T=125C
Vec =1.8 ;          %V - FWD forward voltage drop @Iep
D= 0.85 ;            % - PWM duty factor (Modulation depth)
phase_angle=25.841933; %degree - phase angle btw. output voltage and current pf=0.9
trr= 300*1e-9;        %s - Diode reverse recovery time
Irr= 200   ;              % - Diode peak recovery current
Vce_peak=300 ;         % - Peak voltage across the diode at recovery

%IGBT Loss

Pss=Icp*Vce_sat*((1/8)+(D/(3*pi))*cos(phase_angle)); %Steady-state loss per switching IGBT
Psw=(Esw_on+Esw_off)*fsw*(1/pi);                      %Switching Loss per switching IGBT
PQ = Pss+Psw;                                        %Total loss per IGBT

 %Diode Loss

Pdc=Iep*Vec*((1/8)-(D/(3*pi))*cos(phase_angle));%Steady-state loss per diode
Prr=0.125*Irr*trr*Vce_peak*fsw;                  %Switcihng Loss per diode
PD=Pdc+Prr;                                      %Total loss per diode

%Thermal Parameters
Rth_jc_IGBT1U =0.066; %K/W
Rth_jc_IGBT1L =0.066; %K/W
Rth_jc_IGBT2U =0.066; %K/W
Rth_jc_IGBT2L =0.066; %K/W
Rth_jc_IGBT3U =0.066; %K/W
Rth_jc_IGBT3L =0.066; %K/W
Rth_jc_FWD1U =0.12;  %K/W
Rth_jc_FWD1L =0.12;  %K/W
Rth_jc_FWD2U =0.12;  %K/W
Rth_jc_FWD2L =0.12;  %K/W
Rth_jc_FWD3U =0.12;  %K/W
Rth_jc_FWD3L =0.12;  %K/W
Rth_c1=0.000001  ;      %K/W
Rth_c2=0.000001   ;     %K/W
Rth_c3=0.000001   ;     %K/W
Rth_paste=0.015  ;     %K/W
arr=zeros(10,1)
open_system('Resistive_thermal_model');
for i= 1:1:10
   Rth_heatsink = 0.01*i;      %K/W
    sim('Resistive_thermal_model');
    arr(i)= Tj_IGBT(51);
end;


%x = logsout.getElement({1})
%ds = Simulink.SimulationData.Dataset(arr);

%tempaxis=ScopeData1(:,2)
% timeaxis=ScopeData1(:,1)
%numel(tempaxis)
%tempaxis(numel(tempaxis))

%%relSlip_vals = [0.01 0.02 0.03 0.06];    %K/W
%for i = 1:length(relSlip_vals)
 %   simIn(i) = Simulink.SimulationInput('Resistive_thermal_model');
  % simIn(i) = setVariable(simIn(i),' Rth_heatsink',relSlip_vals(i));
%end

%relSlip=0.05;
%set_param('Resistive_thermal_model/Rth (heatsink)','Value','relSlip')

%h = logsout.plot('Tj(IGBT1U)').Values ;
%get_param('Resistive_thermal_model/Rth (heatsink)', 'ObjectParameters')
%simOut = [sim('Resistive_thermal_model')

