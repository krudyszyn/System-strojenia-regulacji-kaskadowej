function kryt_reg = opt_str_reg_pom(nastawy_p)

global k_p Ti_p Td_p
global typ_reg_pomocniczego 
global iteracje 
global licznik_G_sz mianownik_G_sz

%%---wczytanie nastaw regulatora-------------------------------------------
switch typ_reg_pomocniczego
    case 1                              %regulator P
        k_p = nastawy_p(1);
        %Ti_p = inf;
        %Td_p = 0;
    case 2                              %regulator PI
        k_p = nastawy_p(1);                 
        %Ti_p = nastawy_p(2);
        Td_p = 0;
    case 3                              %regulator PD
        k_p = nastawy_p(1);
        %Ti_p = inf;
        Td_p = nastawy_p(2);
        
    case 4                              %regulator PID
        k_p = nastawy_p(1);
        Ti_p = nastawy_p(2);
        Td_p = nastawy_p(3);
end

nastawy_p

%---symulacja--------------------------------------------------------------
sim('strojenie_reg_pomocniczego.slx') %schemat blokowy regulatora
%{
s = tf('s');
R_p=k_p*(1+1/Ti_p/s+Td_p*s/(0.01*s+1));%transmitancja regulatora pomocniczego
uchyb_ust = R_p.Denominator{:}(end)*mianownik_G_sz(end)/(R_p.Denominator{:}(end)*mianownik_G_sz(end)+R_p.Numerator{:}(end)*licznik_G_sz(end))
%}
kryt_reg = trapz(tout,(uchyb_str_reg_pom).^2) %kryterium jakosci regulacji
   
iteracje = iteracje+1 %zliczanie iteracji algorytmu optymalizacyjnego

end
