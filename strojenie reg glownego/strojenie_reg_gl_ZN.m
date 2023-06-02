k_g=10;
Ti_g=inf;
Td_g=0;

k_p=k_p0;
Ti_p=Ti_p0;
Td_p=Td_p0;




sim('regulacja_kaskadowa.slx') %schemat blokowy regulatora
kryt_reg = trapz(tout,uchyb_reg_glowny.^2) %kryterium jakosci regulacji

figure(1)
plot(tout,odp_reg_kaskadowy)
xlabel('czas')
ylabel('sygnal')
title('odpowiedz regulatora kaskadowego')


