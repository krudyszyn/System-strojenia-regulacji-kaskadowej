%%---nastawy poczatkowe regulatora g��wnego PID--------------------------------------

k_g0 = 0.6*k_kr;                         %wzmocnienie
Ti_g0 = 0.5*T_osc;                       %czas r�niczkowania
Td_g0 = 0.125*T_osc;                     %czas r�niczkowania

%%---nastawy regulatora g��wnego PID-------------------------------------------------
global k_g Ti_g Td_g

k_g = k_g0;                       %wzmocnienie
Ti_g = Ti_g0;                     %czas ca�kowania
Td_g = Td_g0;                     %czas r�niczkowania

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl == 1
    nastawy_pocz = [k_g Ti_g Td_g];            %wektor nastaw pocz�tkowych regulatora PID
    
    nastawy_opt = fminsearch('opt_reg_gl',nastawy_pocz);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = strcat(['kaskada_glPID_',nazwa_pliku])