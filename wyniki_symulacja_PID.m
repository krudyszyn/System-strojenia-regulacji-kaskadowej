function wyniki_symulacja_PID(nazwa_pliku, tryb)
%%---œcie¿ki dostêpu do folderów z M-skryptami-----------------------------
    sciezka = cd;             %sciezka folderu glownego
    sciezka_wyniki = strcat([sciezka, '\wyniki']); %sciezka folderu z wynikami strojenia

%%---wczytanie obiektu-----------------------------------------------------
    obiekt;

    s=tf('s');

%%---wczytanie wyników strojenia regulatora PID----------------------------

    cd(sciezka_wyniki); %przejscie do folderu z wynikami

    reg = load(nazwa_pliku); %odczyt wyników z pliku .mat
    
    T=0.01; %sta³a czasowa inercji cz³onu D regulatora
%%---wyznaczenie transmitancji obiektu z regulatorem-----------------------
G_reg = reg.k*(1+1/reg.Ti/s+reg.Td*s/(T*s+1));      %transmitancja regulatora
G_zam = feedback(G_reg*G,1,-1);                %transmitancja obiektu z regulatorem

if tryb ==1
    %%---wykresy odpowiedzi ukladu---------------------------------------------
    %%---wykres odpowiedzi skokowej-----------------
    figure(1)
    hold on
    step(G_zam)
    title('Charakterystyka Skokowa')
    xlabel('Czas')
    ylabel('Amplituda')
    grid on
end
%%=========================================================================
%%----badania symulacyjne z zak³óceniami-----------------------------------------------------------
if tryb == 2
%%----generowanie zak³ócenia---------------------------------------------
wzmocnienie_zaklocenia = 0.5;
opoznienie_zaklocenia = 200;
czas = 0:0.01:1000;

zaklocenie = zeros(1,length(czas));
for j = 1:length(czas)
    if czas(j)>= opoznienie_zaklocenia
        zaklocenie(j) = wzmocnienie_zaklocenia;
        %zaklocenie=wzmocnienie_zaklocenia*sin(2*pi*10*czas);
    end
end

%%---wyznaczanie odpowiedzi z zak³óceniem---------------------
Yx = step(G_zam, czas); %odpowiedz na "czysty" sygna³ zadany X(s)
    %G_zak =  1/(1+G_reg*G_sz*G_w);
    G_zak =  G_w/(1+G_reg*G_sz*G_w); %transmitancja zak³óceniowa
    Yz = lsim(G_zak,zaklocenie,czas); %odpowiedz na "czyste" zaklocenie Z(s)
    Y = Yx+Yz;
%%---wykresy---------------------------------------------------------------
    %%---wykres odpowiedzi z zak³óceniem------------------------------------
    figure(11)
    %hold on
    plot(czas, Y)
    title('OdpowiedŸ skokowa uk³adu przy wystêpowaniu zak³ócenia')
    xlabel('Czas')
    ylabel('Amplituda')
    grid on
    %%---wykres odpowiedzi zak³ocenia----------------------------------------------
    
    figure(12)
    %hold on
    step(G_zak,czas)
    plot(czas, Yz)
    title('OdpowiedŸ uk³adu na zak³ócenie')
    xlabel('czas')
    ylabel('amplituda')
    legend('regulacja PID')
    grid on
    
    %%---wyznaczanie ISE odpowiedzi z zakloceniem----------------------------
    ISE_bez_zaklocen = reg.kryt_regulacji;
    ISE_z_zakloceniami = trapz(czas,(1-Y).^2);
    deltaISE=ISE_z_zakloceniami-ISE_bez_zaklocen;
    ISE_Yz=trapz(czas,Yz.^2);
    
    disp(nazwa_pliku)
    %disp(deltaISE)
    disp(ISE_Yz)
end
%%---powrot do katalogu glownego-------------------------------------------
cd(sciezka) %powrót do katalogu g³ównego
    
end
