function kryt_reg = opt_reg_gl(nastawy_g)

global k_g Ti_g Td_g
global typ_reg_glownego
global iteracje 

%%---wczytanie nastaw regulatora-------------------------------------------
switch typ_reg_glownego
    case 1                              %regulator P
        k_g = nastawy_g(1);
    case 2                              %regulator PI
        k_g = nastawy_g(1);                 
        Ti_g = nastawy_g(2);
    case 3                              %regulator PD
        k_g = nastawy_g(1);                 
        Td_g = nastawy_g(2);     
    case 4                              %regulator PID
        k_g = nastawy_g(1);
        Ti_g = nastawy_g(2);
        Td_g = nastawy_g(3);
end

nastawy_g;
%---symulacja--------------------------------------------------------------
sim('regulacja_kaskadowa.slx') %schemat blokowy regulatora
kryt_reg = trapz(tout,uchyb_reg_glowny.^2); %kryterium jakosci regulacji

iteracje = iteracje+1; %zliczanie iteracji algorytmu optymalizacyjnego

end


