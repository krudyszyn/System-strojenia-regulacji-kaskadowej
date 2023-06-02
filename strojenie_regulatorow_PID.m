tic

clear all
clc
close all


%%----ustawienia strojenia-------------------------------------------------
wykresy_wl = 1;         %1 - wy�wietlanie wykresow wlaczone
                        %nie 1 - wyswietlanie wykresow wylaczone
optymalizacja_wl = 1;   %1 - optymalizacja w��czona
                        %nie 1 optymalizacja wylaczona

%%---ustawienia czasu symulacji--------------------------------------------
t_krok = 0.01;                          %krok czasowy symulacji
T_symulacji = 1000;                     %czas zako�czenia symulacji

%%---parametry krytyczne uk�adu automatycznej regulacji--------------------
k_kr = 0.764;           %wzmocnienie krytyczne
T_osc = 42.96;          %czas oscylacji

%%---�cie�ki dost�pu do folder�w z M-skryptami-----------------------------
sciezka = cd;             %sciezka folderu glownego
sciezka_wymuszenia = strcat([sciezka, '\wymuszenia']); %sciezka folderu wymuszenia
                       % (zawiera funkcje generuj�ce sygna�y zadawane)
sciezka_strojenie_PID = strcat([sciezka, '\strojenie reg PID']);
sciezka_wyniki = strcat([sciezka, '\wyniki']); %sciezka zapisu nastaw
                                                                                                           
%%---wczytanie transmitancji obiektu---------------------------------------

obiekt;

%%---generowanie sygnalu zadanego do strojenia-----------------------------
cd(sciezka_wymuszenia);   %przejscie do folderu z wymuszeniami

s_zadany_PID=wymuszenie_skokowe(t_krok,T_symulacji); %generowanie wymuszenia skokowego na wejsciu

%%---informacje nt optymalizacji-------------------------------------------
global iteracje                             %licznik iteracji alg. optymalizacyjnego
iteracje = 0; %zerowanie licznika iteracji

%%---strojenie regulatora PID----------------------------------------------
cd(sciezka_strojenie_PID);  %przejscie do folderu z plikami stojenia regulator�w PID

reg_PID                             %regulator PID

%%---symulacja zoptymalizowana----------------------------------------------
sim('regulacja_PID.slx') %schemat blokowy regulatora
kryt_regulacji = sum(uchyb_PID.^2)*t_krok; %kryterium jakosci regulacji

%%---wykresy---------------------------------------------------------------
if wykresy_wl == 1
    %--wykres uchybu-------------------------------------
    figure(1)
    plot(tout, uchyb_PID)
    title('uchyb')
    xlabel('czas')
    ylabel('sygna�')
    grid
    %--wykres odpowiedzi---------------------------------
    figure(2)
    plot(tout, odpowiedz_PID)
    title('odpowiedz')
    xlabel('czas')
    ylabel('sygna�')
    grid
end

%%---zapis zoptymalizowanych nastaw----------------------------------------
cd(sciezka_wyniki); %przejscie do katalogu zapisu nastaw
save(nazwa_pliku, 'k', 'Ti', 'Td', 'kryt_regulacji', 'iteracje','k_0','Ti_0', 'Td_0', 'T_symulacji', 't_krok' )

%%---powrot do katalogu glownego i usuniecie sciezek dostepowych-----------
cd(sciezka) %powr�t do katalogu g��wnego

clear sciezka
clear sciezka_wyniki
clear sciezka_strojenie_PID
clear sciezka_wymuszenia

toc