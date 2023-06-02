function s_zadany_sim = wymuszenie_skokowe(t_krok, T_symulacji)

% s_zadany_sim - wymuszenie skokowe w postaci dla bloczku ToWorkspace 
% t_krok - krok czasowy
% T_symulacji - czas koñca symulacji

czas = (0:t_krok:T_symulacji)'; %wektor czasu symulacji 
skok = ones(length(czas),1); %skok - wektor wymuszenia skokowego 

s_zadany_sim = [czas, skok];

end

