function wyniki_symulacja_kaskada(nazwa_pliku, tryb)
%%---œcie¿ki dostêpu do folderów z M-skryptami-----------------------------
    sciezka = cd;             %sciezka folderu glownego
    sciezka_wyniki = strcat([sciezka, '\wyniki']); %sciezka folderu z wynikami strojenia

%%---wczytanie obiektu-----------------------------------------------------
    obiekt;

    s=tf('s');

%%---wczytanie wyników strojenia regulatora PID-------------------

    cd(sciezka_wyniki); %przejscie do folderu z wynikami

    load(nazwa_pliku); %odczyt wyników z pliku .mat
  
    k_p=reg_pomocniczy.k_p;
    Ti_p=reg_pomocniczy.Ti_p;
    Td_p=reg_pomocniczy.Td_p;
    
    k_g=reg_glowny.k_g;
    Ti_g=reg_glowny.Ti_g;
    Td_g=reg_glowny.Td_g;
    
    T_p = 0.01; %sta³a czasowa inercji cz³onu D regulatora pomocniczego
    T_g = 0.01; %sta³a czasowa inercji cz³onu D regulatora g³ównego
    
    ISE_bez_zaklocen=reg_glowny.kryt_regulacji;
%%---wyznaczenie transmitancji czeœci szybkiej obiektu z regulatorem-------
%%---pomocnicznym----------------------------------------------------------
G_reg_pom = k_p*(1+1/Ti_p/s+Td_p*s/(T_p*s+1));      %transmitancja regulatora pomocniczego
Gz_sz = feedback(G_reg_pom*G_sz,1,-1);     %transmitancja zamkniêtej pêtli wewnêtrznej (czeœæ szybka obiektu z regulatorem pomocniczy)

%%---wyznaczenie transmitancji regulacji kaskadowej------------------------
G_reg_gl = k_g*(1+1/Ti_g/s+Td_g*s/(T_g*s+1));      %transmitancja regulatora g³ównego
G_zam=feedback(G_reg_gl*Gz_sz*G_w, 1,-1);   %transmitancja regulacji kaskadowej

if tryb == 1
    %%---wyznaczenie transmitancji uchybowej regulacji kaskadowej--------------
    E_zam = 1/(1+G_reg_gl*Gz_sz*G_w);           %transmitancja uchybowa obiektu z regulatorem

    %%---wykresy odpowiedzi ukladu---------------------------------------------
    %%---wykres odpowiedzi skokowej-----------------
    figure(1)
    hold on
    step(G_zam)
    %[y,t] = step(G_zam,0:0.05:160);
    %plot(t,y)
    title('Charakterystyka Skokowa')
    xlabel('Czas')
    ylabel('Amplituda')
    grid on
%{
    figure(4)
    hold on
    step(E_zam)
    title('Uchyb regulacji - Wymuszenie Skokowe')
    xlabel('Czas')
    ylabel('Amplituda')
    grid on
%}
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
    %G_zak =  (1+G_reg_pom*G_sz)/(1+G_reg_gl*G_reg_pom*G_sz*G_w+G_reg_pom*G_sz);
    G_zak =  G_w/(1+G_reg_gl*G_reg_pom*G_sz*G_w+G_reg_pom*G_sz); %transmitancja zak³óceniowa
    Yz = lsim(G_zak,zaklocenie,czas); %odpowiedz na "czyste" zaklocenie Z(s)
    Y = Yx+Yz;

    %%---wykres odpowiedzi z zak³óceniem-----------------------------------
    figure(11)
    hold on
    plot(czas, Y)
    title('OdpowiedŸ skokowa przy wystêpowaniu zak³ócenia')
    xlabel('Czas')
    ylabel('Amplituda')

    %%---wykres odpowiedzi zak³ocenia--------------------------------------
    figure(12)
    hold on
    %step(G_zak,czas)
    plot(czas, Yz)
    title('OdpowiedŸ uk³adu na zak³ócenie')
    xlabel('Czas')
    ylabel('Amplituda')

    %%---wyznaczanie ISE odpowiedzi z zakloceniem----------------------------
    ISE_z_zakloceniami = trapz(czas,(1-Y).^2);
    deltaISE=ISE_z_zakloceniami-ISE_bez_zaklocen;
    ISE_Yz=trapz(czas,Yz.^2);
    disp(nazwa_pliku)
    disp(ISE_Yz)
    %disp(deltaISE)
    %disp(ISE_Yz/ISE_bez_zaklocen)
end
 G_zam
  %  figure(14)
   % pzmap(G_zam)
%%---powrot do katalogu glownego-------------------------------------------
cd(sciezka) %powrót do katalogu g³ównego
    
end
