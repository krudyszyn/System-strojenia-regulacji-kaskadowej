%%---nastawy poczatkowe regulatora pomocniczego PD-------------------------

k_p0 = 0.8*k_kr;                  %wzmocnienie
Ti_p0 = inf;
Td_p0 = 0.125*T_osc;               %czas r�niczkowania

%%---nastawy regulatora pomocniczego PD-------------------------------------
global k_p Td_p

k_p = k_p0;               %wzmocnienie
Ti_p = inf;
Td_p = Td_p0;             %sta�a r�niczkowania

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl==1
    nastawy_pocz_p = [k_p Td_p]; %wektor nastaw pocz�tkowych regulatora pomocniczego PD

    nastawy_opt = fminsearch('opt_str_reg_pom',nastawy_pocz_p);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = 'regulator_pom_PD.mat';