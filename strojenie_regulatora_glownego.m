tic

clear all
clc
close all

%%---wybór regulatora g³ównego---------------------------------------------
global typ_reg_glownego

typ_reg_glownego = 1;   %1 - regulator P
                        %2 - regulator PI
                        %3 - regulator PD
                        %4 - regulator PID

%%---wybór nastaw regulatora pomocniczego----------------------------------

typ_reg_pomocniczego =2;   %1 - regulator P
                            %2 - regulator PI
                            %3 - regulator PD
                            %4 - regulator PID

%%---ustawienia strojenia-------------------------------------------------
wykresy_wl = 1;         %1 - wyœwietlanie wykresow wlaczone
                        %nie 1 - wyswietlanie wykresow wylaczone
optymalizacja_wl = 1;     %nie 1 - optymalizacja wylaczona
                        
%%---ustawienia czasu symulacji--------------------------------------------
t_krok = 0.01;                          %krok czasowy symulacji
T_symulacji = 1000;                     %czas zakoñczenia symulacji

%%---wyniki wstepnego strojenia II metod¹ Zieglera Nicolsa-----------------
k_kr = 2*1.7481;   %ISE P 2.8881 PI 3.1753 PD 0.5410 PID 0.8715
                %Ziegler-nicols P 2.5497 PI 1.7481 PD 4.5135 PID 2.5506
                %ISE uchyb przejsciowy P 13420 PD 30097
T_osc = 19.61;  %ISE P 15.48 PI 17.8900 PD 12.31 PID 12.43
                %Ziegler-Nicols P 19.94 PI 19.61 PD 15.56 PID 18.05
                %ISE uchyb przejsciowy P 42.95 PD 34.76
                
%%---œcie¿ki dostêpu do folderów z M-skryptami-----------------------------
sciezka = cd;             %sciezka folderu glownego
sciezka_wymuszenia = strcat([sciezka, '\wymuszenia']); %sciezka folderu wymuszenia
                       % (zawiera funkcje generuj¹ce sygna³y zadawane)
sciezka_str_reg_glownego = strcat([sciezka, '\strojenie reg glownego']);                                      
sciezka_nastawy_reg_pomocniczego = strcat([sciezka, '\strojenie reg pomocniczego']);                                                                                                           
sciezka_wyniki = strcat([sciezka, '\wyniki']); %sciezka folderu przechowuj¹cego wyniki

%%---wczytanie transmitancji obiektu---------------------------------------

obiekt;

%%---wczytanie nastaw regulatora pomocniczego------------------------------ 
%%---i generowanie czêœci nazwy pliku zapisu wyników-----------------------
cd(sciezka_nastawy_reg_pomocniczego);

switch typ_reg_pomocniczego
    case 1                                  %regulator pomocniczy P
        reg_pomocniczy=load('regulator_pom_P.mat');
        nazwa_pliku='pomP.mat';
    case 2                                  %regulator pomocniczy PI
        reg_pomocniczy=load('regulator_pom_PI.mat');
        nazwa_pliku='pomPI.mat';
    case 3                                  %regulator pomocniczy PD
        reg_pomocniczy=load('regulator_pom_PD.mat');
        nazwa_pliku='pomPD.mat';
    case 4                                  %regulator pomocniczy PID
        reg_pomocniczy=load('regulator_pom_PID.mat');
        nazwa_pliku='pomPID.mat';
end

k_p = reg_pomocniczy.k_p;
Ti_p = reg_pomocniczy.Ti_p;
Td_p = reg_pomocniczy.Td_p;
    
%%---generowanie sygnalu zadanego do strojenia-----------------------------
cd(sciezka_wymuszenia);   %przejscie do folderu z wymuszeniami

s_zadany_kaskada=wymuszenie_skokowe(t_krok,T_symulacji); %generowanie wymuszenia skokowego na wejsciu

%%---informacje nt optymalizacji-------------------------------------------
global iteracje                             %licznik iteracji alg. optymalizacyjnego
iteracje = 0; %zerowanie licznika iteracji

%%---uruchamianie strojenia wybranego regulatora g³ównego------------------
cd(sciezka_str_reg_glownego);  %przejscie do folderu z plikami stojenia regulatorów PID

switch typ_reg_glownego
    case 1
        reg_gl_P                               %regulator P  
    case 2                      
        reg_gl_PI                              %regulator PI
    case 3
        reg_gl_PD                              %regulator PD
    case 4
        reg_gl_PID                             %regulator PID        
end

%%---symulacja zoptymalizowana----------------------------------------------
T_symulacji_str = T_symulacji;  %przechowanie wartoœci czasu symulacji
t_krok_str = t_krok;            %przechowanie kroku czasowego

T_symulacji = 1000; 
t_krok = 0.01;

sim('regulacja_kaskadowa.slx') %schemat blokowy regulatora
kryt_regulacji = trapz(tout,uchyb_reg_glowny.^2); %kryterium jakosci regulacji

T_symulacji=T_symulacji_str;
t_krok = t_krok_str;

%%---wykresy---------------------------------------------------------------
if wykresy_wl == 1
    %--wykres uchybu regulatora glownego-----------------
    figure(1)
    plot(tout, uchyb_reg_glowny)
    title('uchyb regulator g³ówny')
    xlabel('czas')
    ylabel('sygna³')
    grid
    %--wykres odpowiedzi regulatora glownego-------------
    figure(2)
    plot(tout, odp_reg_kaskadowy)
    title('odpowiedz regulator glowny')
    xlabel('czas')
    ylabel('sygna³')
    grid
    %--wykres uchybu regulatora pomocniczego------------
    figure(3)
    plot(tout, uchyb_reg_pomocniczy)
    title('uchyb regulatora pomocniczego')
    xlabel('czas')
    ylabel('sygna³')
    grid
  
end

%%---zapis zoptymalizowanych nastaw----------------------------------------
cd(sciezka_wyniki);

reg_glowny.typ_reg_glownego = typ_reg_glownego;
reg_glowny.k_g = k_g;
reg_glowny.Ti_g = Ti_g;
reg_glowny.Td_g = Td_g;
reg_glowny.kryt_regulacji = kryt_regulacji;
reg_glowny.iteracje = iteracje;
reg_glowny.k_g0 = k_g0;
reg_glowny.Ti_g0 = Ti_g0;
reg_glowny.Td_g0 = Td_g0;
reg_glowny.T_symulacji = T_symulacji;
reg_glowny.t_krok = t_krok;

save(nazwa_pliku, 'reg_glowny', 'reg_pomocniczy')

%%---powrot do katalogu glownego i usuniecie sciezek dostepowych-----------
cd(sciezka) %powrót do katalogu g³ównego

clear sciezka
clear sciezka_str_reg_glownego
clear sciezka_wymuszenia
clear sciezka_nastawy_reg_pomocniczego                                                                                                          
clear sciezka_wyniki

toc