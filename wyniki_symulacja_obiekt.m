function wyniki_symulacja_obiekt()
%%---œcie¿ki dostêpu do folderów z M-skryptami-----------------------------
    sciezka = cd;             %sciezka folderu glownego
    sciezka_wymuszenia = strcat([sciezka, '\wymuszenia']); %sciezka folderu wymuszenia
                       % (zawiera funkcje generuj¹ce sygna³y zadawane)

%%---wczytanie obiektu-----------------------------------------------------
    obiekt;

%%---wyznaczenie transmitancji uchybowej regulacji kaskadowej--------------
E = 1-G;           %transmitancja uchybowa obiektu bez pêtli sprzê¿enia zwrotnego

%%---generowanie sygna³u rampy---------------------------------------------
cd(sciezka_wymuszenia)

rampa_sim = wymuszenie_rampa(1, 0.01, 200); %parametry (nachylenie, krok czasowy, czas symulacji)
czas = rampa_sim(:,1);
rampa = rampa_sim(:,2);

%%---wykresy odpowiedzi ukladu---------------------------------------------
%%---wykres odpowiedzi skokowej-----------------
figure(1)
hold on
step(G)
title('Charakterystyka skokowa obiektu')
xlabel('Czas')
ylabel('Amplituda')
grid on
%%---wykres odpowiedzi na wymuszenie ramp¹------
figure(3)
hold on
lsim(G, rampa, czas);
title('Charakterystyka rampowa obiektu')
xlabel('Czas')
ylabel('Amplituda')
grid on
%%---wykresy uchybu ukladu---------------------------------------------
%%---wykres uchyb odpowiedzi skokowej-----------------
figure(4)
hold on
step(E)
title('Uchyb regulacji charakterystyki skokowej')
xlabel('Czas')
ylabel('Amplituda')
grid on

%%---wykres odpowiedzi na wymuszenie ramp¹------
cd(sciezka_wymuszenia)

uchyb_rampa=lsim(E, rampa, czas);

figure(6)
hold on
plot(czas,uchyb_rampa);
title('Uchyb regulacji charakterystyki rampowej')
xlabel('Czas')
ylabel('Amplituda')
grid on

figure(7)
bode(G)
title('Bode diagram G(s)=5/((2s+1)(3s+1)(5s+1)(7s+1)(9s+1))')
grid on



%%---powrot do katalogu glownego-------------------------------------------
cd(sciezka) %powrót do katalogu g³ównego
    
end
