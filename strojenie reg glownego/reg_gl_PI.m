%%---nastawy poczatkowe regulatora g��wnego PI--------------------------

k_g0 = 0.45*k_kr;                   %wzmocnienie
Ti_g0 = 0.83*T_osc;                 %czas ca�kowania
Td_g0 = 0;                

%%---nastawy regulatora g��wnegoo PI-------------------------------------
global k_g Ti_g

k_g = k_g0;               %wzmocnienie
Ti_g = Ti_g0;             %sta�a ca�kowania
Td_g = 0;                 

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl == 1
    nastawy_pocz_g = [k_g Ti_g]; %wektor nastaw pocz�tkowych regulatora g��wnego PI

    nastawy_opt = fminsearch('opt_reg_gl',nastawy_pocz_g);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = strcat(['kaskada_glPI_',nazwa_pliku])