tic 

clear all
clc

close all

%%---wybór trybu pracy---------------------------------------------------
tryb = 1;   %1 - odpowiedz skokowa
            %2 - odpowiedz skokowa z zak³óceniem
            
%%---wybór wyœwietlanych wykresów------------------------------------------
wykresy_obiekt=0;       %wykresy obiektu bez pêtli sprzê¿enia zwrotnego


wykresy_reg_PID_opt=1;       %wykresy obiektu z regulatorem PID kryterium ISE
wykresy_reg_PID_zn=0;       %wykresy obiektu z regulatorem PID Ziegler-Nichols

wykresy_kaskada_P_P=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym P
wykresy_kaskada_P_PI=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PI
wykresy_kaskada_P_PD=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PD
wykresy_kaskada_P_PID=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PID

wykresy_kaskada_PI_P=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym P
wykresy_kaskada_PI_PI=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PI
wykresy_kaskada_PI_PD=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PD
wykresy_kaskada_PI_PID=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PID

wykresy_kaskada_PD_P=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym P
wykresy_kaskada_PD_PI=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PI
wykresy_kaskada_PD_PD=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PD
wykresy_kaskada_PD_PID=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PID

wykresy_kaskada_PID_P=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym P
wykresy_kaskada_PID_PI=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PI
wykresy_kaskada_PID_PD=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PD
wykresy_kaskada_PID_PID=1;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PID

%%---regulacja pomocniczy Ziegler-Nicols i regulacja glowny ISE---------------
wykresy_kaskada_P_P_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym P
wykresy_kaskada_P_PI_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PI
wykresy_kaskada_P_PD_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PD
wykresy_kaskada_P_PID_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PID

wykresy_kaskada_PI_P_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym P
wykresy_kaskada_PI_PI_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PI
wykresy_kaskada_PI_PD_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PD
wykresy_kaskada_PI_PID_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PID

wykresy_kaskada_PD_P_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym P
wykresy_kaskada_PD_PI_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PI
wykresy_kaskada_PD_PD_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PD
wykresy_kaskada_PD_PID_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PID

wykresy_kaskada_PID_P_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym P
wykresy_kaskada_PID_PI_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PI
wykresy_kaskada_PID_PD_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PD
wykresy_kaskada_PID_PID_opt_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PID

%%---regulacja g³ówny i pomocniczy Ziegler-Nicols--------------------------
wykresy_kaskada_P_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym P
wykresy_kaskada_P_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PI
wykresy_kaskada_P_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PD
wykresy_kaskada_P_PID_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PID

wykresy_kaskada_PI_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym P
wykresy_kaskada_PI_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PI
wykresy_kaskada_PI_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PD
wykresy_kaskada_PI_PID_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PID

wykresy_kaskada_PD_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym P
wykresy_kaskada_PD_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PI
wykresy_kaskada_PD_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PD
wykresy_kaskada_PD_PID_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PID

wykresy_kaskada_PID_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym P
wykresy_kaskada_PID_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PI
wykresy_kaskada_PID_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PD
wykresy_kaskada_PID_PID_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PID


%%---wykresy---------------------------------------------------------------
opis_legenda={}; %generowanie opisu wykresu do legendy
figure(11)
ax = axes;
ax.ColorOrder=[
    0.8500    0.3250    0.0980;
    0.3940    0.0840    0.4560;
    0.2660    0.6740    0.0880;%0.0000    0.0000    0.0000;
    0.0000    0.4470    0.7410;
    0.6350    0.0780    0.1840
    ];

figure(12)
ax = axes;
ax.ColorOrder=[
    0.8500    0.3250    0.0980;
    0.3940    0.0840    0.4560;
    0.2660    0.6740    0.0880;%0.0000    0.0000    0.0000;
    0.0000    0.4470    0.7410;
    0.6350    0.0780    0.1840
    ];

%%---generowanie wykresów z regulatorami jednoobwodowymi-------------------

if wykresy_reg_PID_zn == 1             %wykresy obiektu z regulatorem PID
    wyniki_symulacja_PID('regulator_PID zn',tryb)
    opis_legenda{end+1}='regulacja PID zn';
end

if wykresy_reg_PID_opt == 1             %wykresy obiektu z regulatorem PID
    wyniki_symulacja_PID('regulator_PID opt',tryb)
    opis_legenda{end+1}='regulacja PID';
end

%%---generowanie wykresów z regulatorami kaskadowymi-----------------------
if wykresy_kaskada_P_P == 1   %wykresy obiektu z regulatorem kaskadowym P-P
    wyniki_symulacja_kaskada('kaskada_glP_pomP',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-P ISE ISE';
end

if wykresy_kaskada_P_PI == 1  %wykresy obiektu z regulatorem kaskadowym P-PI
    wyniki_symulacja_kaskada('kaskada_glP_pomPI',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PI ISE ISE';
end

if wykresy_kaskada_P_PD == 1  %wykresy obiektu z regulatorem kaskadowym P-PD
    wyniki_symulacja_kaskada('kaskada_glP_pomPD',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PD ISE ISE';
end

if wykresy_kaskada_P_PID == 1 %wykresy obiektu z regulatorem kaskadowym P-PID
    wyniki_symulacja_kaskada('kaskada_glP_pomPID',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PID ISE ISE';
end

if wykresy_kaskada_PI_P == 1 %wykresy obiektu z regulatorem kaskadowym PI-P
    wyniki_symulacja_kaskada('kaskada_glPI_pomP',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-P ISE ISE';
end

if wykresy_kaskada_PI_PI == 1 %wykresy obiektu z regulatorem kaskadowym PI-PI
    wyniki_symulacja_kaskada('kaskada_glPI_pomPI',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PI ISE ISE';
end

if wykresy_kaskada_PI_PD == 1 %wykresy obiektu z regulatorem kaskadowym PI-PD
    wyniki_symulacja_kaskada('kaskada_glPI_pomPD',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PD ISE ISE';
end

if wykresy_kaskada_PI_PID == 1 %wykresy obiektu z regulatorem kaskadowym PI-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PID ISE ISE';
end

if wykresy_kaskada_PD_P == 1 %wykresy obiektu z regulatorem kaskadowym PD-P
    wyniki_symulacja_kaskada('kaskada_glPD_pomP',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-P ISE ISE';
end

if wykresy_kaskada_PD_PI == 1 %wykresy obiektu z regulatorem kaskadowym PD-PI
    wyniki_symulacja_kaskada('kaskada_glPD_pomPI',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PI ISE ISE';
end

if wykresy_kaskada_PD_PD == 1 %wykresy obiektu z regulatorem kaskadowym PD-PD
    wyniki_symulacja_kaskada('kaskada_glPD_pomPD',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PD ISE ISE';
end

if wykresy_kaskada_PD_PID == 1 %wykresy obiektu z regulatorem kaskadowym PD-PID
    wyniki_symulacja_kaskada('kaskada_glPD_pomPID',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PID ISE ISE';
end

if wykresy_kaskada_PID_P == 1 %wykresy obiektu z regulatorem kaskadowym PID-P
    wyniki_symulacja_kaskada('kaskada_glPID_pomP',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-P ISE ISE';
end

if wykresy_kaskada_PID_PI == 1 %wykresy obiektu z regulatorem kaskadowym PID-PI
    wyniki_symulacja_kaskada('kaskada_glPID_pomPI',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PI ISE ISE';
end

if wykresy_kaskada_PID_PD == 1 %wykresy obiektu z regulatorem kaskadowym PID-PD
    wyniki_symulacja_kaskada('kaskada_glPID_pomPD',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PD ISE ISE';
end

if wykresy_kaskada_PID_PID == 1 %wykresy obiektu z regulatorem kaskadowym PID-PID
    wyniki_symulacja_kaskada('kaskada_glPID_pomPID',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PID ISE ISE';
end

%%---regulacja g³ówny Ziegler-Nicols i regulacja pomocniczy ISE------------
if wykresy_kaskada_P_P_opt_zn == 1   %wykresy obiektu z regulatorem kaskadowym P-P
    wyniki_symulacja_kaskada('kaskada_glP_pomP_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-P ISE ZN';
end

if wykresy_kaskada_P_PI_opt_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PI
    wyniki_symulacja_kaskada('kaskada_glP_pomPI_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PI ISE ZN';
end

if wykresy_kaskada_P_PD_opt_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PD
    wyniki_symulacja_kaskada('kaskada_glP_pomPD_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PD ISE ZN';
end

if wykresy_kaskada_P_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym P-PID
    wyniki_symulacja_kaskada('kaskada_glP_pomPID_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PID ISE ZN';
end

if wykresy_kaskada_PI_P_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-P
    wyniki_symulacja_kaskada('kaskada_glPI_pomP_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-P ISE ZN';
end

if wykresy_kaskada_PI_PI_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PI
    wyniki_symulacja_kaskada('kaskada_glPI_pomPI_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PI ISE ZN';
end

if wykresy_kaskada_PI_PD_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PD
    wyniki_symulacja_kaskada('kaskada_glPI_pomPD_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PD ISE ZN';
end

if wykresy_kaskada_PI_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PID ISE ZN';
end

if wykresy_kaskada_PD_P_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-P
    wyniki_symulacja_kaskada('kaskada_glPD_pomP_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-P ISE ZN';
end

if wykresy_kaskada_PD_PI_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PI
    wyniki_symulacja_kaskada('kaskada_glPD_pomPI_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PI ISE ZN';
end

if wykresy_kaskada_PD_PD_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PD
    wyniki_symulacja_kaskada('kaskada_glPD_pomPD_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PD ISE ZN';
end

if wykresy_kaskada_PD_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PID
    wyniki_symulacja_kaskada('kaskada_glPD_pomPID_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PID ISE ZN';
end

if wykresy_kaskada_PID_P_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-P
    wyniki_symulacja_kaskada('kaskada_glPID_pomP_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-P ISE ZN';
end

if wykresy_kaskada_PID_PI_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PI
    wyniki_symulacja_kaskada('kaskada_glPID_pomPI_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PI ISE ZN';
end

if wykresy_kaskada_PID_PD_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PD
    wyniki_symulacja_kaskada('kaskada_glPID_pomPD_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PD ISE ZN';
end

if wykresy_kaskada_PID_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PID
    wyniki_symulacja_kaskada('kaskada_glPID_pomPID_opt_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PID ISE ZN';
end

%%---regulacja g³ówny i pomocniczy Ziegler-Nicols--------------------------
if wykresy_kaskada_P_P_zn_zn == 1   %wykresy obiektu z regulatorem kaskadowym P-P
    wyniki_symulacja_kaskada('kaskada_glP_pomP_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-P ZN ZN';
end

if wykresy_kaskada_P_PI_zn_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PI
    wyniki_symulacja_kaskada('kaskada_glP_pomPI_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PI ZN ZN';
end

if wykresy_kaskada_P_PD_zn_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PD
    wyniki_symulacja_kaskada('kaskada_glP_pomPD_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PD ZN ZN';
end

if wykresy_kaskada_P_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym P-PID
    wyniki_symulacja_kaskada('kaskada_glP_pomPID_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa P-PID ZN ZN';
end

if wykresy_kaskada_PI_P_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-P
    wyniki_symulacja_kaskada('kaskada_glPI_pomP_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-P ZN ZN';
end

if wykresy_kaskada_PI_PI_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PI
    wyniki_symulacja_kaskada('kaskada_glPI_pomPI_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PI ZN ZN';
end

if wykresy_kaskada_PI_PD_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PD
    wyniki_symulacja_kaskada('kaskada_glPI_pomPD_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PD ZN ZN';
end

if wykresy_kaskada_PI_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PI-PID ZN ZN';
end

if wykresy_kaskada_PD_P_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-P
    wyniki_symulacja_kaskada('kaskada_glPD_pomP_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-P ZN ZN';
end

if wykresy_kaskada_PD_PI_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PI
    wyniki_symulacja_kaskada('kaskada_glPD_pomPI_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PI ZN ZN';
end

if wykresy_kaskada_PD_PD_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PD
    wyniki_symulacja_kaskada('kaskada_glPD_pomPD_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PD ZN ZN';
end

if wykresy_kaskada_PD_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PID
    wyniki_symulacja_kaskada('kaskada_glPD_pomPID_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PD-PID ZN ZN';
end

if wykresy_kaskada_PID_P_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-P
    wyniki_symulacja_kaskada('kaskada_glPID_pomP_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-P ZN ZN';
end

if wykresy_kaskada_PID_PI_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PI
    wyniki_symulacja_kaskada('kaskada_glPID_pomPI_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PI ZN ZN';
end

if wykresy_kaskada_PID_PD_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PD
    wyniki_symulacja_kaskada('kaskada_glPID_pomPD_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PD ZN ZN';
end

if wykresy_kaskada_PID_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PID
    wyniki_symulacja_kaskada('kaskada_glPID_pomPID_zn_zn',tryb)
    opis_legenda{end+1}='regulacja kaskadowa PID-PID ZN ZN';
end



%%---opisy wykresów--------------------------------------------------------
if tryb == 1
    figure(1)
    legend(opis_legenda, 'Location', 'southeast')
    set(1,'Unit', 'centimeters', 'Position',[12.88,9,15.8,10.07]); %ustawienie rozmiaru okna
    ax=gca;
    ax.Units='centimeters';
    ax.Position =[1.4128,1.13650,13.7795,8.1831];
    
    %figure(4)
    %legend(opis_legenda, 'Location', 'southeast')
end

if tryb == 2
    figure(11)
    legend(opis_legenda, 'Location', 'southeast')
    set(11,'Unit', 'centimeters', 'Position',[12.88,9,15.8,10.07]); %ustawienie rozmiaru okna
    ax=gca;
    ax.Units='centimeters';
    ax.Position =[1.6562,1.1365,13.5890,8.1831]%[1.4128,1.13650,13.7795,8.1831];
    ax.XLim = [0 400];
    grid minor
    
    figure(12)
    legend(opis_legenda(1:end-1))
    set(12,'Unit', 'centimeters', 'Position',[12.88,9,15.8,10.07]); %ustawienie rozmiaru okna
    ax=gca;
    ax.Units='centimeters';
    ax.Position =[1.6562,1.1365,13.5890,8.1831];%[1.4128,1.13650,13.7795,8.1831];
    ax.XLim = [195 600];
    grid minor
    %{
    x=[0 1000];
    y_plus=[0.01 0.01];
    y_minus=[-0.01 -0.01];
    plot(x,y_plus)
    plot(x,y_minus)
    %}
end

toc