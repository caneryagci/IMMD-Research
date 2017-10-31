%Loss Calculation Parameters
Esw_on=41*1e-3;     %J - IGBT's turn-on switching energy per pulse at peak current (Icp, T=125C)
Esw_off=32*1e-3;    %J - IGBT's turn-off switching energy per pulse at peak current (Icp, T=125C)
fsw = 5000;         %Hz - PWM switching frequency for every inverter arm-switch
Icp= 300;           %A - Peak value of sinusoidal output current
Iep= 300;           %A Icp=Iep
Vce_sat=2  ;        %V - IGBT saturation voltage drop @Icp and T=125C
Vec =1.8 ;          %V - FWD forward voltage drop @Iep
D= 0.85 ;            % - PWM duty factor (Modulation depth)
phase_angle=18.195; %degree - phase angle btw. output voltage and current pf=0.95
trr= 300*1e-9;      %s - Diode reverse recovery time
Irr= 300   ;    % - Diode peak recovery current
Vce_peak=300 ;       % - Peak voltage across the diode at recovery

%IGBT Loss

Pss=Icp*Vce_sat*((1/8)+(D/(3*pi))*cos(phase_angle)) %Steady-state loss per switching IGBT
Psw=(Esw_on+Esw_off)*fsw*(1/pi)                     %Switching Loss per switching IGBT
PQ = Pss+Psw;                                        %Total loss per IGBT

 %Diode Loss

Pdc=Iep*Vec*((1/8)-(D/(3*pi))*cos(phase_angle)) %Steady-state loss per diode
Prr=0.125*Irr*trr*Vce_peak*fsw                  %Switcihng Loss per diode
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
Rth_c1=0.00001  ;      %K/W
Rth_c2=0.00001   ;     %K/W
Rth_c3=0.00001   ;     %K/W
Rth_paste=0.015  ;     %K/W
Rth_heatsink=0.01 ;    %K/W

%sim('Resistive_thermal_model');
