%%---nastawy poczatkowe regulatora głównego PID--------------------------------------

k_g0 = 0.6*k_kr;                         %wzmocnienie
Ti_g0 = 0.5*T_osc;                       %czas różniczkowania
Td_g0 = 0.125*T_osc;                     %czas różniczkowania

%%---nastawy regulatora głównego PID-------------------------------------------------
global k_g Ti_g Td_g

k_g = k_g0;                       %wzmocnienie
Ti_g = Ti_g0;                     %czas całkowania
Td_g = Td_g0;                     %czas różniczkowania

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl == 1
    nastawy_pocz = [k_g Ti_g Td_g];            %wektor nastaw początkowych regulatora PID
    
    nastawy_opt = fminsearch('opt_reg_gl',nastawy_pocz);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = strcat(['kaskada_glPID_',nazwa_pliku])