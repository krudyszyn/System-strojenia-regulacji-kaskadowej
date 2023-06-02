%%---nastawy poczatkowe regulatora pomocniczego P--------------------------

k_g0 = 0.5*k_kr;                 %wzmocnienie
Ti_g0 = inf;
Td_g0 = 0;

%%---nastawy regulatora pomocniczego P-------------------------------------
global k_g

k_g = k_g0;                       %wzmocnienie
Ti_g = inf;
Td_g = 0;

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl == 1
    nastawy_pocz_g = [k_g]; %wektor nastaw pocz¹tkowych regulatora pomocniczego P

    nastawy_opt = fminsearch('opt_reg_gl',nastawy_pocz_g);
end

%---zapis do pliku---------------------------------------------------------
nazwa_pliku = strcat(['kaskada_glP_',nazwa_pliku])