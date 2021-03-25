% script plots GRACE error models. 
% The models are taken from Kim, Phd Thesis from Center of Space Research, UT Austin and Bjoern Frommknecht Phd Thesis. 
% They are adapted for our analysis of inter-satellite range-rate observations. 
% The units are [micro meter/s]
% @ Sujata Goswami

%% KBR Error model
fe=[1e-6:.1e-5:1e-3 1.1e-3:1e-3:5];
ome = 2*pi*fe;
psystem=ones(size(fe))*1e-12;


%% ACC Error model
paccaccx=(1+.005./fe)*1e-20; %Kim et al. 2001 bzw MRD ... for acceleration about sensitive axis
paccaccy=(1+0.1./fe)*1e-18; %... for acceleration about the less sensitive axis
  
% plot figure
FigH = figure('Position',  get(0, 'Screensize'));
loglog(fe, sqrt(psystem.*ome.^2),'k', 'LineWidth', 2)
hold on,
loglog(fe, sqrt(2*paccaccx./ome.^2),'r', 'Linewidth', 2)
hold on,
hold on,
loglog(fe, sqrt(2*paccaccy./ome.^2),'b', 'Linewidth', 2) % lowsensitive axis
hold on,
legend({'$\mathrm{KBR\;system\;noise}$', '$\mathrm{ACC\;noise\;(less\;sensitive\;axis)}$', '$\mathrm{ACC\;noise\;(high\;sensitive\;axis)}$' }, 'interpreter', 'latex')
xlabel('frequency [Hz]' , 'interpreter', 'latex')
ylabel('[micro meter/s/rt(Hz)]' , 'interpreter', 'latex')

grid on
xlim([1e-4 1e-1]), ylim([1e-8 1e-4]),
set(gca,'TickLabelInterpreter', 'latex')
pbaspect([1.4 1 1]),
set(gca, 'Position', get(gca, 'OuterPosition')-get(gca, 'TightInset') * [-1 0 1 0; 0 -1 0 1; 0 0 1 0; 0 0 0 1]);
set(gcf, 'PaperPositionMode', 'auto');
