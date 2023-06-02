tic

clear all
clc
close all

%%---wybór regulatora pomocniczego------------------------------------------------------
global typ_reg_pomocniczego

typ_reg_pomocniczego = 2;     %1 - regulator P
                        %2 - regulator PI
                        %3 - regulator PD
                        %4 - regulator PID

%%----ustawienia strojenia-------------------------------------------------
wykresy_wl = 1;         %1 - wyœwietlanie wykresow wlaczone
                        %nie 1 - wyswietlanie wykresow wylaczone
optymalizacja_wl = 1;   %1 - optymalizacja w³¹czona
                        %nie 1 optymalizacja wylaczona
                        
%%---parametry krytyczne regulacji pomocniczej--------------------------------------------
t_krok = 0.01;                          %krok czasowy symulacji
T_symulacji =1000;                     %czas zakoñczenia symulacji

%%---wyniki wstepnego strojenia II metod¹ Zieglera Nicolsa-----------------
k_kr = 4.667;
T_osc = 10.89;

%%---œcie¿ki dostêpu do folderów z M-skryptami-----------------------------
sciezka = cd;             %sciezka folderu glownego
sciezka_str_reg_pomocniczego = strcat([sciezka, '\strojenie reg pomocniczego']);                                      
                                                                                                           
%%---wczytanie transmitancji obiektu---------------------------------------
obiekt;
%{
global licznik_G_sz mianownik_G_sz
licznik_G_sz = G_sz.Numerator{:};
mianownik_G_sz = G_sz.Denominator{:};
%}

%%---informacje nt optymalizacji-------------------------------------------
global iteracje                             %licznik iteracji alg. optymalizacyjnego
iteracje = 0; %zerowanie licznika iteracji

%%---uruchamianie strojenia wybranego regulatora pomocniczego--------------
cd(sciezka_str_reg_pomocniczego);  %przejscie do folderu z plikami stojenia regulatorów PID

switch typ_reg_pomocniczego
    case 1
        reg_pom_P                               %regulator P  
    case 2                      
        reg_pom_PI                              %regulator PI
    case 3
        reg_pom_PD                              %regulator PD
    case 4
        reg_pom_PID                             %regulator PID
        
end

%%---symulacja zoptymalizowana----------------------------------------------
T_symulacji_str = T_symulacji;  %przechowanie wartoœci czasu symulacji
t_krok_str = t_krok;            %przechowanie kroku czasowego

T_symulacji = 1000; 
t_krok = 0.01;

sim('strojenie_reg_pomocniczego.slx') %schemat blokowy regulatora
%{
s = tf('s');
R_p=k_p*(1+1/Ti_p/s+Td_p*s/(0.01*s+1));%transmitancja regulatora pomocniczego
uchyb_ust = R_p.Denominator{:}(end)*mianownik_G_sz(end)/(R_p.Denominator{:}(end)*mianownik_G_sz(end)+R_p.Numerator{:}(end)*licznik_G_sz(end))
%}
kryt_regulacji = trapz(tout,(uchyb_str_reg_pom).^2) %kryterium jakosci regulacji

T_symulacji=T_symulacji_str;
t_krok = t_krok_str;
%%---wykresy---------------------------------------------------------------
if wykresy_wl == 1
    %--wykres uchybu-------------------------------------
    figure(1)
    plot(tout, uchyb_str_reg_pom)
    title('uchyb')
    xlabel('czas')
    ylabel('sygna³')
    grid
    %--wykres odpowiedzi---------------------------------
    figure(2)
    plot(tout, odp_str_reg_pom)
    title('odpowiedz')
    xlabel('czas')
    ylabel('sygna³')
    grid
end

%%---zapis zoptymalizowanych nastaw----------------------------------------
save(nazwa_pliku, 'typ_reg_pomocniczego', 'k_p', 'Ti_p', 'Td_p', 'kryt_regulacji', 'iteracje', 'k_p0','Ti_p0', 'Td_p0', 'T_symulacji', 't_krok' )

%%---powrot do katalogu glownego i usuniecie sciezek dostepowych-----------
cd(sciezka) %powrót do katalogu g³ównego

clear sciezka
clear sciezka_str_reg_pomocniczego
clear sciezka_wymuszenia

toc