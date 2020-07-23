clear all;
clc;

load data_jktdepok.mat;
JD = interval;
load data_batam.mat;
BT = interval;
load kasus_jktdepok.mat;
load kasus_batam.mat;

tf1 = length(JD);
tf2 = length(BT);

td1  = datetime(2020,3,2) + caldays(1:tf1);
x1   = [td1, fliplr(td1)];

td2  = datetime(2020,3,19) + caldays(1:tf2);
x2  = [td2, fliplr(td2)];


figure(1)
subplot(2,2,1)
nCase = [1017 31 36 17 4 22 17 11 3 8 7 3 3 4 1 2 2 1 0 2 1 1 0 2 0 0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0]; % Jakarta+Depok
sCase = [0*ones(1,nCase(1)) ones(1,nCase(2)) 2*ones(1,nCase(3)) 3*ones(1,nCase(4)) 4*ones(1,nCase(5)) 5*ones(1,nCase(6)) 6*ones(1,nCase(7)) 7*ones(1,nCase(8)) 8*ones(1,nCase(9)) 9*ones(1,nCase(10)) 10*ones(1,nCase(11)) 11*ones(1,nCase(12)) 12*ones(1,nCase(13)) 13*ones(1,nCase(14)) 14*ones(1,nCase(15)) 15*ones(1,nCase(16)) 16*ones(1,nCase(17)) 17*ones(1,nCase(18)) 18*ones(1,nCase(19)) 19*ones(1,nCase(20)) 20*ones(1,nCase(21)) 21*ones(1,nCase(22)) 22*ones(1,nCase(23)) 23*ones(1,nCase(24)) 24*ones(1,nCase(25)) 25*ones(1,nCase(26)) 26*ones(1,nCase(27)) 27*ones(1,nCase(28)) 28*ones(1,nCase(29)) 29*ones(1,nCase(30)) 30*ones(1,nCase(31)) 31*ones(1,nCase(32)) 32*ones(1,nCase(33)) 33*ones(1,nCase(34)) 34*ones(1,nCase(35)) 35*ones(1,nCase(36)) 36*ones(1,nCase(37)) 37*ones(1,nCase(38)) 38*ones(1,nCase(39)) 39*ones(1,nCase(40)) 40*ones(1,nCase(41)) 41*ones(1,nCase(42)) 42*ones(1,nCase(43)) 43*ones(1,nCase(44)) 44*ones(1,nCase(45)) 45*ones(1,nCase(46)) 46*ones(1,nCase(47)) 47*ones(1,nCase(48)) 48*ones(1,nCase(49)) 49*ones(1,nCase(50)) 50*ones(1,nCase(51)) 51*ones(1,nCase(52)) 53*ones(1,nCase(53))];
nCase = nCase/length(sCase);
[phat,pci] = nbinfit(sCase,0.05);
bar(0:length(nCase)-1,nCase,'FaceColor',[0 0 1],'EdgeColor',[0 0 0],'LineWidth',1.5)
hold on
plot(0:length(nCase)-1,nbinpdf(0:length(nCase)-1,phat(1),phat(2)),':k','LineWidth',4);
set(gca,'color','none','FontSize',24)
text(0.2,0.85,['K-number Jakarta-Depok'],'FontSize',24,'Units','normalized')
text(0.2,0.70,[num2str(round(phat(1),2)),' [95% CI:',num2str(round(pci(1,1),2)),'-',num2str(round(pci(2,1),2)),']'],'FontSize',24,'Units','normalized')
ylabel('Frequency')
xlabel('Secondary Cases')
xlim([-1 10])
ylim([0 1])
grid minor
grid on

subplot(2,2,2)
nCase = [63 12 3 4 1 2 0 1 1 1 0 0 0 1]; % Batam
sCase = [0*ones(1,nCase(1)) ones(1,nCase(2)) 2*ones(1,nCase(3)) 3*ones(1,nCase(4)) 4*ones(1,nCase(5)) 5*ones(1,nCase(6)) 6*ones(1,nCase(7)) 7*ones(1,nCase(8)) 8*ones(1,nCase(9)) 9*ones(1,nCase(10)) 10*ones(1,nCase(11)) 11*ones(1,nCase(12)) 12*ones(1,nCase(13)) 13*ones(1,nCase(14))];
nCase = nCase/length(sCase);
[phat,pci] = nbinfit(sCase,0.05);
bar(0:length(nCase)-1,nCase,'FaceColor',[0 0 1],'EdgeColor',[0 0 0],'LineWidth',1.5)
hold on
plot(0:length(nCase)-1,nbinpdf(0:length(nCase)-1,phat(1),phat(2)),':k','LineWidth',4);
set(gca,'color','none','FontSize',24)
text(0.2,0.85,['K-number Batam'],'FontSize',24,'Units','normalized')
text(0.2,0.70,[num2str(round(phat(1),2)),' [95% CI:',num2str(round(pci(1,1),2)),'-',num2str(round(pci(2,1),2)),']'],'FontSize',24,'Units','normalized')
ylabel('Frequency')
xlabel('Secondary Cases')
xlim([-1 10])
ylim([0 1])
grid minor
grid on

subplot(2,2,3)
yyaxis left
inBetween = [JD(:,1)', fliplr(JD(:,3)')];
fill(x1, inBetween, 'r');
alpha(0.3)
hold on;
plot(td1,JD(:,2)','-r','LineWidth',4)
set(gca,'color','none','FontSize',36)
ax = gca; ax.YColor = 'r';
ylim([0 15])
ylabel('R_t','color','r')
xlim([min(td1), min(td1)+15])
text(0.3,0.85,['R0 Jakarta-Depok'],'FontSize',24,'Units','normalized')
text(0.3,0.70,[num2str(round(max(JD(:,2)),2)),' [95% CI:',num2str(round(max(JD(:,1)),2)),'-',num2str(round(max(JD(:,3)),2)),']'],'FontSize',24,'Units','normalized')
grid on
grid minor
xtickangle(45)
xx = get(gca,'XTickLabel');
set(gca,'XTickLabel',xx,'fontsize',24)
yyaxis right
bar(td1,kasus_jktdepok,'b')
alpha(0.3)
ylabel('Active Cases','color','b')
ax = gca; ax.YColor = 'b';

subplot(2,2,4)
yyaxis left
inBetween = [BT(:,1)', fliplr(BT(:,3)')];
fill(x2, inBetween, 'r');
alpha(0.3)
hold on;
plot(td2,BT(:,2)','-r','LineWidth',4)
set(gca,'color','none','FontSize',24)
ax = gca; ax.YColor = 'r';
ylim([0 5])
ylabel('R_t','color','r')
xlim([min(td2)+5, min(td2)+35])
text(0.01,0.85,['R0 Batam'],'FontSize',24,'Units','normalized')
text(0.01,0.70,[num2str(round(max(BT(:,2)),2)),' [95% CI:',num2str(round(max(BT(:,1)),2)),'-',num2str(round(max(BT(:,3)),2)),']'],'FontSize',24,'Units','normalized')
grid on
grid minor
xtickangle(45)
xx = get(gca,'XTickLabel');
set(gca,'XTickLabel',xx,'fontsize',24)
yyaxis right
bar(td2,kasus_batam,'b')
alpha(0.3)
ylabel('Active Cases','color','b')
ax = gca; ax.YColor = 'b';
