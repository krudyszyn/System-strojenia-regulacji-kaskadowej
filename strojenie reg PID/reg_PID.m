%%---nastawy poczatkowe regulatora PID--------------------------------------

k_0 = 0.6*k_kr;                         %wzmocnienie
Ti_0 = 0.5*T_osc;                       %czas r�niczkowania
Td_0 = 0.125*T_osc;                     %czas r�niczkowania

%%---nastawy regulatora PID-------------------------------------------------
global k Ti Td

k = k_0;                       %wzmocnienie
Ti = Ti_0;                     %czas ca�kowania
Td = Td_0;                     %czas r�niczkowania

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl==1
nastawy_pocz = [k Ti Td];            %wektor nastaw pocz�tkowych regulatora PID

nastawy_opt = fminsearch('opt_PID',nastawy_pocz);
end
%---zapis do pliku---------------------------------------------------------
if optymalizacja_wl==1
    nazwa_pliku = 'regulator_PID opt.mat';
else
    nazwa_pliku = 'regulator_PID zn.mat';
end