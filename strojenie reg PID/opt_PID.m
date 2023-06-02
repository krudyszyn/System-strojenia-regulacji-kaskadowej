function kryt_reg = opt_PID(nastawy)

global k Ti Td
global iteracje 

%%---wczytanie nastaw regulatora-------------------------------------------
k = nastawy(1);
Ti = nastawy(2);
Td = nastawy(3);

nastawy;

%---symulacja--------------------------------------------------------------
sim('regulacja_PID.slx') %schemat blokowy regulatora
kryt_reg = trapz(tout,uchyb_PID.^2); %kryterium jakosci regulacji

iteracje = iteracje+1; %zliczanie iteracji algorytmu optymalizacyjnego

end

