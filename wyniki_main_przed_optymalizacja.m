tic 

clear all
clc

close all

%%---wybór wyœwietlanych wykresów------------------------------------------
wykresy_obiekt=0;       %wykresy obiektu bez pêtli sprzê¿enia zwrotnego

wykresy_reg_P=0;        %wykresy obiektu z regulatorem P
wykresy_reg_PI=0;       %wykresy obiektu z regulatorem PI
wykresy_reg_PD=0;       %wykresy obiektu z regulatorem PD
wykresy_reg_PID=1;       %wykresy obiektu z regulatorem PID

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
wykresy_kaskada_PID_PID=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PID

%%---regulator g³ówny Ziegler-Nicols i regulator pomocniczy ISE---------------
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

%%---regulator g³ówny i pomocniczy Ziegler-Nicols--------------------------
wykresy_kaskada_P_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym P
wykresy_kaskada_P_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PI
wykresy_kaskada_P_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PD
wykresy_kaskada_P_PID_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym P i pomocniczym PID

wykresy_kaskada_PI_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym P
wykresy_kaskada_PI_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PI
wykresy_kaskada_PI_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PD
wykresy_kaskada_PI_PID_zn_zn=1;   %wykresy obiektu z regulatorem g³ównym PI i pomocniczym PID

wykresy_kaskada_PD_P_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym P
wykresy_kaskada_PD_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PI
wykresy_kaskada_PD_PD_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PD
wykresy_kaskada_PD_PID_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PD i pomocniczym PID

wykresy_kaskada_PID_P_zn_zn=1;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym P
wykresy_kaskada_PID_PI_zn_zn=0;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PI
wykresy_kaskada_PID_PD_zn_zn=1;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PD
wykresy_kaskada_PID_PID_zn_zn=1;   %wykresy obiektu z regulatorem g³ównym PID i pomocniczym PID


%%---wykresy---------------------------------------------------------------
opis_legenda={}; %generowanie opisu wykresu do legendy

%%---generowanie wykresów z regulatorami jednoobwodowymi-------------------
if wykresy_reg_P == 1               %wykresy obiektu z regulatorem P
    wyniki_symulacja_PID('regulator_P')
    opis_legenda{end+1}='regulator P';
end

if wykresy_reg_PI == 1              %wykresy obiektu z regulatorem PI
    wyniki_symulacja_PID('regulator_PI')
    opis_legenda{end+1}='regulator PI';
end

if wykresy_reg_PD == 1              %wykresy obiektu z regulatorem PD
    wyniki_symulacja_PID('regulator_PD')
    opis_legenda{end+1}='regulator PD';
end

if wykresy_reg_PID == 1             %wykresy obiektu z regulatorem PID
    wyniki_symulacja_PID('regulator_PID')
    opis_legenda{end+1}='regulator PID';
end

%%---generowanie wykresów z regulatorami kaskadowymi-----------------------
if wykresy_kaskada_P_P == 1   %wykresy obiektu z regulatorem kaskadowym P-P
    wyniki_symulacja_kaskada('kaskada_glP_pomP')
    opis_legenda{end+1}='regulator kaskadowy P-P';
end

if wykresy_kaskada_P_PI == 1  %wykresy obiektu z regulatorem kaskadowym P-PI
    wyniki_symulacja_kaskada('kaskada_glP_pomPI')
    opis_legenda{end+1}='regulator kaskadowy P-PI';
end

if wykresy_kaskada_P_PD == 1  %wykresy obiektu z regulatorem kaskadowym P-PD
    wyniki_symulacja_kaskada('kaskada_glP_pomPD')
    opis_legenda{end+1}='regulator kaskadowy P-PD';
end

if wykresy_kaskada_P_PID == 1 %wykresy obiektu z regulatorem kaskadowym P-PID
    wyniki_symulacja_kaskada('kaskada_glP_pomPID')
    opis_legenda{end+1}='regulator kaskadowy P-PID';
end

if wykresy_kaskada_PI_P == 1 %wykresy obiektu z regulatorem kaskadowym PI-P
    wyniki_symulacja_kaskada('kaskada_glPI_pomP')
    opis_legenda{end+1}='regulator kaskadowy PI-P';
end

if wykresy_kaskada_PI_PI == 1 %wykresy obiektu z regulatorem kaskadowym PI-PI
    wyniki_symulacja_kaskada('kaskada_glPI_pomPI')
    opis_legenda{end+1}='regulator kaskadowy PI-PI';
end

if wykresy_kaskada_PI_PD == 1 %wykresy obiektu z regulatorem kaskadowym PI-PD
    wyniki_symulacja_kaskada('kaskada_glPI_pomPD')
    opis_legenda{end+1}='regulator kaskadowy PI-PD';
end

if wykresy_kaskada_PI_PID == 1 %wykresy obiektu z regulatorem kaskadowym PI-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID')
    opis_legenda{end+1}='regulator kaskadowy PI-PID';
end

if wykresy_kaskada_PD_P == 1 %wykresy obiektu z regulatorem kaskadowym PD-P
    wyniki_symulacja_kaskada('kaskada_glPD_pomP')
    opis_legenda{end+1}='regulator kaskadowy PD-P';
end

if wykresy_kaskada_PD_PI == 1 %wykresy obiektu z regulatorem kaskadowym PD-PI
    wyniki_symulacja_kaskada('kaskada_glPD_pomPI')
    opis_legenda{end+1}='regulator kaskadowy PD-PI';
end

if wykresy_kaskada_PD_PD == 1 %wykresy obiektu z regulatorem kaskadowym PD-PD
    wyniki_symulacja_kaskada('kaskada_glPD_pomPD')
    opis_legenda{end+1}='regulator kaskadowy PD-PD';
end

if wykresy_kaskada_PD_PID == 1 %wykresy obiektu z regulatorem kaskadowym PD-PID
    wyniki_symulacja_kaskada('kaskada_glPD_pomPID')
    opis_legenda{end+1}='regulator kaskadowy PD-PID';
end

if wykresy_kaskada_PID_P == 1 %wykresy obiektu z regulatorem kaskadowym PID-P
    wyniki_symulacja_kaskada('kaskada_glPID_pomP')
    opis_legenda{end+1}='regulator kaskadowy PID-P';
end

if wykresy_kaskada_PID_PI == 1 %wykresy obiektu z regulatorem kaskadowym PID-PI
    wyniki_symulacja_kaskada('kaskada_glPID_pomPI')
    opis_legenda{end+1}='regulator kaskadowy PID-PI';
end

if wykresy_kaskada_PID_PD == 1 %wykresy obiektu z regulatorem kaskadowym PID-PD
    wyniki_symulacja_kaskada('kaskada_glPID_pomPD')
    opis_legenda{end+1}='regulator kaskadowy PID-PD';
end

if wykresy_kaskada_PID_PID == 1 %wykresy obiektu z regulatorem kaskadowym PID-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID')
    opis_legenda{end+1}='regulator kaskadowy PID-PID';
end

%%---regulator g³ówny Ziegler-Nicols i regulator pomocniczy ISE------------
if wykresy_kaskada_P_P_opt_zn == 1   %wykresy obiektu z regulatorem kaskadowym P-P
    wyniki_symulacja_kaskada('kaskada_glP_pomP_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy P-P ISE ZN';
end

if wykresy_kaskada_P_PI_opt_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PI
    wyniki_symulacja_kaskada('kaskada_glP_pomPI_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy P-PI ISE ZN';
end

if wykresy_kaskada_P_PD_opt_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PD
    wyniki_symulacja_kaskada('kaskada_glP_pomPD_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy P-PD ISE ZN';
end

if wykresy_kaskada_P_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym P-PID
    wyniki_symulacja_kaskada('kaskada_glP_pomPID_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy P-PID ISE ZN';
end

if wykresy_kaskada_PI_P_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-P
    wyniki_symulacja_kaskada('kaskada_glPI_pomP_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-P ISE ZN';
end

if wykresy_kaskada_PI_PI_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PI
    wyniki_symulacja_kaskada('kaskada_glPI_pomPI_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-PI ISE ZN';
end

if wykresy_kaskada_PI_PD_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PD
    wyniki_symulacja_kaskada('kaskada_glPI_pomPD_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-PD ISE ZN';
end

if wykresy_kaskada_PI_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-PID ISE ZN';
end

if wykresy_kaskada_PD_P_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-P
    wyniki_symulacja_kaskada('kaskada_glPD_pomP_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-P ISE ZN';
end

if wykresy_kaskada_PD_PI_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PI
    wyniki_symulacja_kaskada('kaskada_glPD_pomPI_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-PI ISE ZN';
end

if wykresy_kaskada_PD_PD_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PD
    wyniki_symulacja_kaskada('kaskada_glPD_pomPD_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-PD ISE ZN';
end

if wykresy_kaskada_PD_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PID
    wyniki_symulacja_kaskada('kaskada_glPD_pomPID_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-PID ISE ZN';
end

if wykresy_kaskada_PID_P_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-P
    wyniki_symulacja_kaskada('kaskada_glPID_pomP_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-P ISE ZN';
end

if wykresy_kaskada_PID_PI_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PI
    wyniki_symulacja_kaskada('kaskada_glPID_pomPI_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-PI ISE ZN';
end

if wykresy_kaskada_PID_PD_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PD
    wyniki_symulacja_kaskada('kaskada_glPID_pomPD_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-PD ISE ZN';
end

if wykresy_kaskada_PID_PID_opt_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID_opt_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-PID ISE ZN';
end

%%---regulator g³ówny i pomocniczy Ziegler-Nicols--------------------------
if wykresy_kaskada_P_P_zn_zn == 1   %wykresy obiektu z regulatorem kaskadowym P-P
    wyniki_symulacja_kaskada('kaskada_glP_pomP_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy P-P ZN ZN';
end

if wykresy_kaskada_P_PI_zn_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PI
    wyniki_symulacja_kaskada('kaskada_glP_pomPI_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy P-PI ZN ZN';
end

if wykresy_kaskada_P_PD_zn_zn == 1  %wykresy obiektu z regulatorem kaskadowym P-PD
    wyniki_symulacja_kaskada('kaskada_glP_pomPD_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy P-PD ZN ZN';
end

if wykresy_kaskada_P_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym P-PID
    wyniki_symulacja_kaskada('kaskada_glP_pomPID_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy P-PID ZN ZN';
end

if wykresy_kaskada_PI_P_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-P
    wyniki_symulacja_kaskada('kaskada_glPI_pomP_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-P ZN ZN';
end

if wykresy_kaskada_PI_PI_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PI
    wyniki_symulacja_kaskada('kaskada_glPI_pomPI_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-PI ZN ZN';
end

if wykresy_kaskada_PI_PD_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PD
    wyniki_symulacja_kaskada('kaskada_glPI_pomPD_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-PD ZN ZN';
end

if wykresy_kaskada_PI_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PI-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PI-PID ZN ZN';
end

if wykresy_kaskada_PD_P_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-P
    wyniki_symulacja_kaskada('kaskada_glPD_pomP_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-P ZN ZN';
end

if wykresy_kaskada_PD_PI_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PI
    wyniki_symulacja_kaskada('kaskada_glPD_pomPI_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-PI ZN ZN';
end

if wykresy_kaskada_PD_PD_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PD
    wyniki_symulacja_kaskada('kaskada_glPD_pomPD_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-PD ZN ZN';
end

if wykresy_kaskada_PD_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PD-PID
    wyniki_symulacja_kaskada('kaskada_glPD_pomPID_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PD-PID ZN ZN';
end

if wykresy_kaskada_PID_P_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-P
    wyniki_symulacja_kaskada('kaskada_glPID_pomP_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-P ZN ZN';
end

if wykresy_kaskada_PID_PI_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PI
    wyniki_symulacja_kaskada('kaskada_glPID_pomPI_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-PI ZN ZN';
end

if wykresy_kaskada_PID_PD_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PD
    wyniki_symulacja_kaskada('kaskada_glPID_pomPD_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-PD ZN ZN';
end

if wykresy_kaskada_PID_PID_zn_zn == 1 %wykresy obiektu z regulatorem kaskadowym PID-PID
    wyniki_symulacja_kaskada('kaskada_glPI_pomPID_zn_zn')
    opis_legenda{end+1}='regulator kaskadowy PID-PID ZN ZN';
end
%}
%%---opisy wykresów--------------------------------------------------------
for j=1:3:4
    figure(j)
    legend(opis_legenda)
end

toc