%%---nastawy poczatkowe regulatora pomocniczego P--------------------------

k_p0 = 0.5*k_kr;                 %wzmocnienie
Ti_p0 = inf;
Td_p0 = 0;

%%---nastawy regulatora pomocniczego P-------------------------------------
global k_p

k_p = k_p0;                       %wzmocnienie
Ti_p = inf;
Td_p = 0;

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl==1
    nastawy_pocz_p = [k_p]; %wektor nastaw pocz¹tkowych regulatora pomocniczego P

    nastawy_opt = fminsearch('opt_str_reg_pom',nastawy_pocz_p);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = 'regulator_pom_P.mat';