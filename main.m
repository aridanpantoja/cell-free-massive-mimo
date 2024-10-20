% Trabalho feito por: Aridan Pantoja, Karol Wojtyla e Manuela Nunes

close all;  clc;

% Parâmetros Gerais 

M = 100;                                                % Número de antenas
K = 40;                                                 % Número de usuários
area = 1000 * 1000;                                     % Área de simulação (1km²)
pot_down = 100e-3;                                      % Potência de Downlink (100mW)
pot_up = 100e-3;                                        % Potência de Upplink (100mW)
BW = 20e6;                                              % Largura de Banda (20MHz)
Tc = 196;                                               % Tempo de Coerência
Tp = min(K, Tc);                                        % Tempo para estimativa do canal
noise = 9;                                              % Ruído (9dB)

% Canal Real

beta = 1 ./ (distances_ue_ap.^3.8);

% Potência Normalizada

pot_noise = 20e6 * 1.381e-23 * 290* 10^(noise/10);      % Potência do Ruído
pot_norm = pot_up / pot_noise;                          % Potência Normalizada

% Estimação do Canal MMSE

gama = (Tp * pot_norm * (betas.^2))./(Tp * pot_norm * betas + 1);

% Cálculo dos Coeficientes de Potência

etas = 1 ./ sum(gama, 1);