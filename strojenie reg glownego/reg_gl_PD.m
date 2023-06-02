%%---nastawy poczatkowe regulatora pomocniczego PD-------------------------

k_g0 = 0.8*k_kr;                  %wzmocnienie
Ti_g0 = inf;
Td_g0 = 0.125*T_osc;               %czas ró¿niczkowania

%%---nastawy regulatora pomocniczego PD-------------------------------------
global k_g Td_g

k_g = k_g0;               %wzmocnienie
Ti_g = inf;
Td_g = Td_g0;             %sta³a ró¿niczkowania

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl == 1
    nastawy_pocz_g = [k_g Td_g]; %wektor nastaw pocz¹tkowych regulatora pomocniczego PD

    nastawy_opt = fminsearch('opt_reg_gl',nastawy_pocz_g);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = strcat(['kaskada_glPD_',nazwa_pliku])