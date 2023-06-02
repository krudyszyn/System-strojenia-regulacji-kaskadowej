function s_zadany_sim = wymuszenie_rampa(nachylenie, t_krok, T_symulacji)

% s_zadany_sim - wymuszenie skokowe w postaci dla bloczku ToWorkspace 
% nachylenie - wspó³czynnik nachylenia k¹towego rampy
% t_krok - krok czasowy
% T_symulacji - czas koñca symulacji

czas = (0:t_krok:T_symulacji)'; %wektor czasu symulacji 
rampa = nachylenie*czas; %skok - wektor wymuszenia skokowego 

s_zadany_sim = [czas, rampa];

end