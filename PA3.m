set(0, 'DefaultFigureWindowStyle', 'docked')
set(0, 'defaultaxesfontsize', 20)
set(0, 'defaultaxesfontname', 'Times New Roman')
set(0, 'DefaultLineLineWidth', 2);

clear all
close all

    global C

    addpath ../geom2d/geom2d

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s
    
    x = 0;
    xp = 0;
    
    v = 0;
    F = 1;
    m = 1
    
    
    dt = 1;
    nt = 1000;
    np = 1;
    v = zeros(np,1);
    x = zeros(np, 1);
    t = 0
    
    re = 0;
    
    P = 1 - exp(-dt/20);
    
    for i = 2:nt
        t(i) = t(i-1) + dt;
        
        v(:, i) = v(:, i -1) + F/m*dt;
        x(:, i) = x(:, i -1) + v(:, i -1)*dt + (F/m*dt^2)/2;
        
        r = rand(np, 1) < P;
        v(r, i) = re*v(r, i);
        AveV(i, :) = mean(v, 2);
        
        plot(x(1, :), v(1, :), 'r-');
        grid on;
        xlabel('x');
        ylabel('v');
        title(['Average v:' num2str(AveV(i))]);
        
        pause(0.1)
        
    end

