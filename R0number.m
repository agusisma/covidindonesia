clear;
clc;

load data_jktdepok.mat; % 3 Mar -15 Jun
JD = interval;
load data_batam.mat; % 20 Mar -11 Jun
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
subplot(2,1,1)
yyaxis left
inBetween = [JD(:,1)', fliplr(JD(:,3)')];
fill(x1, inBetween, 'k');
alpha(0.3)
hold on;
plot(td1,JD(:,2)','-k','LineWidth',4)
set(gca,'color','none','FontSize',36)
ax = gca; ax.YColor = 'k';
ylim([0 15])
ylabel('R0','color','k')
xlim([min(td1), min(td1)+30])
text(0.01,0.85,['R0 Jakarta-Depok = ',num2str(round(max(JD(:,2)),2)),' [95% CI:',num2str(round(max(JD(:,1)),2)),'-',num2str(round(max(JD(:,3)),2)),']'],'FontSize',36,'Units','normalized')
grid on
grid minor
xtickangle(45)
xx = get(gca,'XTickLabel');
set(gca,'XTickLabel',xx,'fontsize',36)
yyaxis right
bar(td1,kasus_jktdepok,'k')
alpha(0.3)
ylabel('Active Cases','color','k')
ax = gca; ax.YColor = 'k';
subplot(2,1,2)
yyaxis left
inBetween = [BT(:,1)', fliplr(BT(:,3)')];
fill(x2, inBetween, 'k');
alpha(0.3)
hold on;
plot(td2,BT(:,2)','-k','LineWidth',4)
set(gca,'color','none','FontSize',36)
ax = gca; ax.YColor = 'k';
ylim([0 5])
ylabel('R0','color','k')
xlim([min(td2)+5, min(td2)+35])
text(0.01,0.85,['R0 Batam = ',num2str(round(max(BT(:,2)),2)),' [95% CI:',num2str(round(max(BT(:,1)),2)),'-',num2str(round(max(BT(:,3)),2)),']'],'FontSize',36,'Units','normalized')
grid on
grid minor
xtickangle(45)
xx = get(gca,'XTickLabel');
set(gca,'XTickLabel',xx,'fontsize',36)
yyaxis right
bar(td2,kasus_batam,'k')
alpha(0.3)
ylabel('Active Cases','color','k')
ax = gca; ax.YColor = 'k';