%%---obiekt----------------------------------------------------------------
K_ob = 5;                               %wzmocnienie obiektu                
T_ob = [2 3 5 7 11];                         %sta�e czasowe

%---cz�� szybka obiektu---------------------------------------------------
K_sz = 2;                                %wzmocnienie cz�ci szybkiej obiektu
indeksy_T_sz = [1 2 3];                 %indeksy sta�ych czasowych cz�ci szybkiej obiektu 
                                        %(wybierane ze sta�ych czasowych obiektu T_ob)
T_sz = T_ob(indeksy_T_sz);                %sta�e czasowe cz�ci szybkiej obiektu

%---czesc wolna obiektu----------------------------------------------------
K_w = K_ob / K_sz;                         %wzmocnienie cz�ci wolnej obiektu
indeksy_T_w = setdiff(1:length(T_ob), indeksy_T_sz); %indeksy sta�ych czasowych cz�ci szybkiej obiektu 
                                        %(wybierane ze sta�ych czasowych obiektu T_ob
T_w = T_ob(indeksy_T_w);                  %sta�e czasowe cz�ci wolnej obiektu

%---wyznaczanie transmitancji----------------------------------------------
s=tf('s');

%transmitancja obiektu
G=tf(K_ob);
for j=1:length(T_ob)
    G=G/(T_ob(j)*s+1);
end

%transmitacja cz�ci szybkiej obiektu
G_sz=tf(K_sz);
for j=1:length(T_sz)
    G_sz=G_sz/(T_sz(j)*s+1);
end                                            

%transmitacja cz�ci wolnej obiektu
G_w=tf(K_w);
for j=1:length(T_w)
    G_w=G_w/(T_w(j)*s+1);
end

%%---usuwanie niepotrzebnych danych----------------------------------------
clear K_ob K_sz K_w
clear T_ob T_sz T_w
clear indeksy_T_w indeksy_T_sz
clear s
clear j
