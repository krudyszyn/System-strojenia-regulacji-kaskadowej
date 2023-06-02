%%---nastawy poczatkowe regulatora pomocniczego PI--------------------------

k_p0 = 0.6*k_kr;                         %wzmocnienie
Ti_p0 = 0.5*T_osc;                       %czas r�niczkowania
Td_p0 = 0.125*T_osc;                     %czas r�niczkowania

%%---nastawy regulatora pomocniczego PI-------------------------------------
global k_p Ti_p Td_p

k_p = k_p0;               %wzmocnienie
Ti_p = Ti_p0;             %sta�a ca�kowania
Td_p = Td_p0;             %sta�a r�niczkowania 

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl==1
    nastawy_pocz_p = [k_p Ti_p Td_p]; %wektor nastaw pocz�tkowych regulatora pomocniczego PD

    nastawy_opt = fminsearch('opt_str_reg_pom',nastawy_pocz_p);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = 'regulator_pom_PID.mat';