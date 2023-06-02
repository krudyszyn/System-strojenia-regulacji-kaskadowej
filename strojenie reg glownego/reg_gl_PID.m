%%---nastawy poczatkowe regulatora g³ównego PID--------------------------------------

k_g0 = 0.6*k_kr;                         %wzmocnienie
Ti_g0 = 0.5*T_osc;                       %czas ró¿niczkowania
Td_g0 = 0.125*T_osc;                     %czas ró¿niczkowania

%%---nastawy regulatora g³ównego PID-------------------------------------------------
global k_g Ti_g Td_g

k_g = k_g0;                       %wzmocnienie
Ti_g = Ti_g0;                     %czas ca³kowania
Td_g = Td_g0;                     %czas ró¿niczkowania

%%---optymalizacja---------------------------------------------------------
if optymalizacja_wl == 1
    nastawy_pocz = [k_g Ti_g Td_g];            %wektor nastaw pocz¹tkowych regulatora PID
    
    nastawy_opt = fminsearch('opt_reg_gl',nastawy_pocz);
end
%---zapis do pliku---------------------------------------------------------
nazwa_pliku = strcat(['kaskada_glPID_',nazwa_pliku])