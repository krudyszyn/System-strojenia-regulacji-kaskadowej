function wyniki_symulacja_czesc_wolna()
%%---œcie¿ki dostêpu do folderów z M-skryptami-----------------------------
    sciezka = cd;             %sciezka folderu glownego
    sciezka_wymuszenia = strcat([sciezka, '\wymuszenia']); %sciezka folderu wymuszenia
                       % (zawiera funkcje generuj¹ce sygna³y zadawane)

%%---wczytanie obiektu-----------------------------------------------------
    obiekt;

%%---wyznaczenie transmitancji uchybowej regulacji kaskadowej--------------
E = 1-G_w;           %transmitancja uchybowa obiektu bez pêtli sprzê¿enia zwrotnego

%%---generowanie sygna³u rampy---------------------------------------------
cd(sciezka_wymuszenia)

rampa_sim = wymuszenie_rampa(1, 0.01, 200); %parametry (nachylenie, krok czasowy, czas symulacji)
czas = rampa_sim(:,1);
rampa = rampa_sim(:,2);

%%---wykresy odpowiedzi ukladu---------------------------------------------
%%---wykres odpowiedzi skokowej-----------------
figure(1)
hold on
step(G_w)
title('Charakterystyka Skokowa')
xlabel('Czas')
ylabel('Amplituda')
grid on
%{
%%---wykres odpowiedzi impulsowej---------------
figure(2)
hold on
impulse(G_w)
title('Odpowiedz Impulsowa')
xlabel('Czas')
ylabel('Amplituda')
grid on
%}
%%---wykres odpowiedzi na wymuszenie ramp¹------
figure(3)
hold on
lsim(G_w, rampa, czas);
title('Odpowiedz - Wymuszenie Rampa')
xlabel('Czas')
ylabel('Amplituda')
grid on

%%---wykresy uchybu ukladu---------------------------------------------
%%---wykres uchyb odpowiedzi skokowej-----------------
figure(4)
hold on
step(E)
title('Uchyb Regulacji - Wymuszenie Skokowe')
xlabel('Czas')
ylabel('Amplituda')
grid on
%{
%%---wykres odpowiedzi impulsowej---------------
figure(5)
hold on
impulse(E)
title('Uchyb Regulacji - Wymuszenie Impulsowe')
xlabel('Czas')
ylabel('Amplituda')
grid on
%%---wykres odpowiedzi na wymuszenie ramp¹------
cd(sciezka_wymuszenia)

uchyb_rampa=lsim(E, rampa, czas);

figure(6)
hold on
plot(czas,uchyb_rampa);
title('Uchyb Regulacji - Wymuszenie Rampa')
xlabel('Czas')
ylabel('Amplituda')
grid on
%}
%%-charakterystyka Bodego
figure(7)
hold on
bode(G_w)
grid on
%%-charakterystyka skokowa znormalizowana
figure(8)
hold on
step(G_w/2.5)
title('Charakterystyka Skokowa Znormalizowana')
xlabel('Czas')
ylabel('Amplituda')
grid on
%%---powrot do katalogu glownego-------------------------------------------
cd(sciezka) %powrót do katalogu g³ównego

end
