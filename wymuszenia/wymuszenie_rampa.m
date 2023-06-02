function s_zadany_sim = wymuszenie_rampa(nachylenie, t_krok, T_symulacji)

% s_zadany_sim - wymuszenie skokowe w postaci dla bloczku ToWorkspace 
% nachylenie - wsp�czynnik nachylenia k�towego rampy
% t_krok - krok czasowy
% T_symulacji - czas ko�ca symulacji

czas = (0:t_krok:T_symulacji)'; %wektor czasu symulacji 
rampa = nachylenie*czas; %skok - wektor wymuszenia skokowego 

s_zadany_sim = [czas, rampa];

end