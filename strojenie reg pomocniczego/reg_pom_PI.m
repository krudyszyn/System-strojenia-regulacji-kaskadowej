%%---nastawy poczatkowe regulatora pomocniczego PI--------------------------

k_p0 = 0.45*k_kr;                   %wzmocnienie
Ti_p0 = 0.83*T_osc;                 %czas ca³kowania
Td_p0 = 0;                

%%---nastawy regulatora pomocniczego PI-------------------------------------
global k_p Ti_p

k_p = k_p0;               %wzmocnienie
Ti_p = Ti_p0;             %sta³a ca³kowania
Td_p = 0;                 

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl==1
    nastawy_pocz_p = [k_p Ti_p]; %wektor nastaw pocz¹tkowych regulatora pomocniczego PD

    nastawy_opt = fminsearch('opt_str_reg_pom',nastawy_pocz_p);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = 'regulator_pom_PI.mat';