%% SUBJ across COND --   PRIMARY EYE POSITION
%need to be able to access means of each subj close all
%% colors
par = parula
beta = 0.65
c1 = par(1,:,:)
c2 = par(2,:,:)
c3 = brighten(c1,beta)
c4 = brighten(c2,beta)
% c3 = par(7,:,:)  
% c4 = par(8,:,:)
c5 = par(17,:,:)
c6 = par(18,:,:)
c7 = brighten(c5, beta)
c8 = brighten(c6, beta)
% c7 = par(23,:,:)
% c8 = par(24,:,:)
c9 = par(34,:,:)
c10 = par(35,:,:)
c11 = brighten(c9,beta)
c12 = brighten(c10,beta)
% c11 = par(39,:,:)
% c12 = par(40,:,:)
c13 = par(55,:,:)
c14 = par(56,:,:)
c15 = brighten(c13,beta)
c16 = brighten(c14,beta)
% c15 = par(63,:,:)
% c16 = par(64,:,:)

parspec = [c1; c2; c3; c4; c5; c6; c7; c8; c9; c10; c11; c12; c13; c14; c15; c16];

%%

subj = {'subj01','subj02', 'subj03'}; %,'subj04'
cond  =  {'pilot','l_spcs','l_ips2'}; %'l_ips2',
num_cond = length(cond);
num_subj = length(subj);  
median_primary_err_hi_left_group = []; 
median_primary_err_hi_right_group = []; 
median_primary_err_lo_left_group = []; 
median_primary_err_lo_right_group = []; 

for ss = 1:num_subj;
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_lo.mat',subj{ss},cond{cc});
        resultsfile = load(filename);
        median_primary_err_lo_left_cond(ss,cc) = resultsfile.ii_results_lo.median_no_break_left_primary_err_z_new;
        median_primary_err_lo_right_cond(ss,cc) = resultsfile.ii_results_lo.median_no_break_right_primary_err_z_new;
        group_lo_left(ss,cc) = [median_primary_err_lo_left_group; resultsfile.ii_results_lo.median_no_break_left_primary_err_z_new];
        group_lo_right(ss,cc) = [median_primary_err_lo_right_group; resultsfile.ii_results_lo.median_no_break_right_primary_err_z_new];
    end 
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_hi.mat',subj{ss},cond{cc});
        resultsfile = load(filename)
        median_primary_err_hi_left_cond(ss,cc) = resultsfile.ii_results_hi.median_no_break_left_primary_err_z_new;
        median_primary_err_hi_right_cond(ss,cc) = resultsfile.ii_results_hi.median_no_break_right_primary_err_z_new;
        group_hi_left(ss,cc) = [median_primary_err_hi_left_group; resultsfile.ii_results_hi.median_no_break_left_primary_err_z_new];
        group_hi_right(ss,cc) = [median_primary_err_hi_right_group; resultsfile.ii_results_hi.median_no_break_right_primary_err_z_new];
    end
end 



% 
% loleftspcs = std(primary_err_lo_left_cond_subj_lspcs)/sqrt(length(primary_err_lo_left_cond_subj_lspcs))
% lorightspcs = std(primary_err_lo_right_cond_subj_lspcs)/sqrt(length(primary_err_lo_right_cond_subj_lspcs))
% hileftspcs = std(primary_err_hi_left_cond_subj_lspcs)/sqrt(length(primary_err_hi_left_cond_subj_lspcs))
% hirightspcs = std(primary_err_hi_right_cond_subj_lspcs)/sqrt(length(primary_err_hi_right_cond_subj_lspcs))
% 
% loleftpilot = std(primary_err_lo_left_cond_subj_pilot)/sqrt(length(primary_err_lo_left_cond_subj_pilot))
% lorightpilot = std(primary_err_lo_right_cond_subj_pilot)/sqrt(length(primary_err_lo_right_cond_subj_pilot))
% hileftpilot = std(primary_err_hi_left_cond_subj_pilot)/sqrt(length(primary_err_hi_left_cond_subj_pilot))
% hirightpilot = std(primary_err_hi_right_cond_subj_pilot)/sqrt(length(primary_err_hi_right_cond_subj_pilot))
% 
% subj03sem = [loleftspcs  lorightspcs hileftspcs hirightspcs loleftpilot lorightpilot hileftpilot hirightpilot]



for ii = 1:num_cond;
group_mean_lo_right(ii) = mean(median_primary_err_lo_right_cond(:,ii));
group_mean_lo_left(ii) = mean(median_primary_err_lo_left_cond(:,ii));
group_mean_hi_left(ii) = mean(median_primary_err_hi_left_cond(:,ii));
group_mean_hi_right(ii) = mean(median_primary_err_hi_right_cond(:,ii));
end

% get std for abs diff 
ipsi_one = median_primary_err_lo_left_cond(:,1)- median_primary_err_hi_left_cond(:,1)
contra_one = median_primary_err_lo_right_cond(:,1)- median_primary_err_hi_right_cond(:,1)
ipsi_two = median_primary_err_lo_left_cond(:,2)- median_primary_err_hi_left_cond(:,2)
contra_two = median_primary_err_lo_right_cond(:,2)- median_primary_err_hi_right_cond(:,2)
ipsi_three = median_primary_err_lo_left_cond(:,3)- median_primary_err_hi_left_cond(:,3)
contra_three = median_primary_err_lo_right_cond(:,3)- median_primary_err_hi_right_cond(:,3)

sem_ipsi_one = std(ipsi_one)/sqrt(length(ipsi_one))
sem_contra_one = std(contra_one)/sqrt(length(contra_one))
sem_ipsi_two = std(ipsi_two)/sqrt(length(ipsi_two))
sem_contra_two = std(contra_two)/sqrt(length(contra_two))
sem_ipsi_three = std(ipsi_three)/sqrt(length(ipsi_three))
sem_contra_three = std(contra_three)/sqrt(length(contra_three))
diff_vect = [sem_ipsi_one sem_contra_one sem_ipsi_two sem_contra_two sem_ipsi_three sem_contra_three]

% for ii = 1:num_cond;

% group_mean_lo_right(ii) = mean(primary_err_lo_right_cond_subj(:,ii));
% group_mean_lo_left(ii) = mean(primary_err_lo_left_cond_subj(:,ii));
% group_mean_hi_left(ii) = mean(primary_err_hi_left_cond_subj(:,ii));
% group_mean_hi_right(ii) = mean(primary_err_hi_right_cond_subj(:,ii));
% end

for jj = 1:num_subj;
    subj_mean_pri_hi_left = mean(median_primary_err_hi_left_cond,2)
    subj_mean_pri_hi_right = mean(median_primary_err_hi_right_cond,2)
    subj_mean_pri_lo_left = mean(median_primary_err_lo_left_cond,2)
    subj_mean_pri_lo_right = mean(median_primary_err_lo_right_cond,2)
end

subj01_demeand = mean([subj_mean_pri_hi_left(1) subj_mean_pri_hi_right(1) subj_mean_pri_lo_left(1) subj_mean_pri_lo_right(1)]);
subj02_demeand = mean([subj_mean_pri_hi_left(2) subj_mean_pri_hi_right(2) subj_mean_pri_lo_left(2) subj_mean_pri_lo_right(2)]); 
subj03_demeand = mean([subj_mean_pri_hi_left(3) subj_mean_pri_hi_right(3) subj_mean_pri_lo_left(3) subj_mean_pri_lo_right(3)]);
%subj04_demeand = mean([subj_mean_pri_hi_left(4) subj_mean_pri_hi_right(4) subj_mean_pri_lo_left(4) subj_mean_pri_lo_right(4)]);

%now substract these means from subject medians 
% 
 subj01_phl_one_demeaned = median_primary_err_hi_left_cond(1,1)- subj01_demeand;
 subj01_phl_two_demeaned = median_primary_err_hi_left_cond(1,2)- subj01_demeand;
 subj01_phl_three_demeaned = median_primary_err_hi_left_cond(1,3)- subj01_demeand;
 subj01_phr_one_demeaned = median_primary_err_hi_right_cond(1,1)- subj01_demeand;
 subj01_phr_two_demeaned = median_primary_err_hi_right_cond(1,2)- subj01_demeand;
 subj01_phr_three_demeaned = median_primary_err_hi_right_cond(1,3)- subj01_demeand;

 subj01_pll_one_demeaned = median_primary_err_lo_left_cond(1,1)- subj01_demeand;
 subj01_pll_two_demeaned = median_primary_err_lo_left_cond(1,2)- subj01_demeand;
 subj01_pll_three_demeaned = median_primary_err_lo_left_cond(1,3)- subj01_demeand;
 subj01_plr_one_demeaned = median_primary_err_lo_right_cond(1,1)- subj01_demeand;
 subj01_plr_two_demeaned = median_primary_err_lo_right_cond(1,2)- subj01_demeand;
 subj01_plr_three_demeaned = median_primary_err_lo_right_cond(1,3)- subj01_demeand;
 
 
 subj02_phl_one_demeaned = median_primary_err_hi_left_cond(2,1)- subj02_demeand;
 subj02_phl_two_demeaned = median_primary_err_hi_left_cond(2,2)- subj02_demeand;
 subj02_phl_three_demeaned = median_primary_err_hi_left_cond(2,3)- subj02_demeand;
 subj02_phr_one_demeaned = median_primary_err_hi_right_cond(2,1)- subj02_demeand;
 subj02_phr_two_demeaned = median_primary_err_hi_right_cond(2,2)- subj02_demeand;
 subj02_phr_three_demeaned = median_primary_err_hi_right_cond(2,3)- subj02_demeand;

 subj02_pll_one_demeaned = median_primary_err_lo_left_cond(2,1)- subj02_demeand;
 subj02_pll_two_demeaned = median_primary_err_lo_left_cond(2,2)- subj02_demeand;
 subj02_pll_three_demeaned = median_primary_err_lo_left_cond(2,3)- subj02_demeand;
 subj02_plr_one_demeaned = median_primary_err_lo_right_cond(2,1)- subj02_demeand;
 subj02_plr_two_demeaned = median_primary_err_lo_right_cond(2,2)- subj02_demeand;
 subj02_plr_three_demeaned = median_primary_err_lo_right_cond(2,3)- subj02_demeand;
 
 subj03_phl_one_demeaned = median_primary_err_hi_left_cond(3,1)- subj03_demeand;
 subj03_phl_two_demeaned = median_primary_err_hi_left_cond(3,2)- subj03_demeand;
 subj03_phl_three_demeaned = median_primary_err_hi_left_cond(3,3)- subj03_demeand;
 subj03_phr_one_demeaned = median_primary_err_hi_right_cond(3,1)- subj03_demeand;
 subj03_phr_two_demeaned = median_primary_err_hi_right_cond(3,2)- subj03_demeand;
 subj03_phr_three_demeaned = median_primary_err_hi_right_cond(3,3)- subj03_demeand;

 subj03_pll_one_demeaned = median_primary_err_lo_left_cond(3,1)- subj03_demeand;
 subj03_pll_two_demeaned = median_primary_err_lo_left_cond(3,2)- subj03_demeand;
 subj03_pll_three_demeaned = median_primary_err_lo_left_cond(3,3)- subj03_demeand;
 subj03_plr_one_demeaned = median_primary_err_lo_right_cond(3,1)- subj03_demeand;
 subj03_plr_two_demeaned = median_primary_err_lo_right_cond(3,2)- subj03_demeand;
 subj03_plr_three_demeaned = median_primary_err_lo_right_cond(3,3)- subj03_demeand;
 
 
 
%  
%  subj04_phl_one_demeaned = median_primary_err_hi_left_cond(3,1)- subj04_demeand;
%  subj04_phl_two_demeaned = median_primary_err_hi_left_cond(3,2)- subj04_demeand;
%  subj04_phr_one_demeaned = median_primary_err_hi_right_cond(3,1)- subj04_demeand;
%  subj04_phr_two_demeaned = median_primary_err_hi_right_cond(3,2)- subj04_demeand;
% 
%  subj04_pll_one_demeaned = median_primary_err_lo_left_cond(3,1)- subj04_demeand;
%  subj04_pll_two_demeaned = median_primary_err_lo_left_cond(3,2)- subj04_demeand;
%  subj04_plr_one_demeaned = median_primary_err_lo_right_cond(3,1)- subj04_demeand;
%  subj04_plr_two_demeaned = median_primary_err_lo_right_cond(3,2)- subj04_demeand;
 
 
 % concat group for condition one (pilot)
 demeand_pri_hi_left_cond_one = [subj01_phl_one_demeaned subj02_phl_one_demeaned  subj03_phl_one_demeaned] % subj04_phl_one_demeaned];
 demeand_pri_hi_right_cond_one = [subj01_phr_one_demeaned subj02_phr_one_demeaned  subj03_phr_one_demeaned]% subj04_phr_one_demeaned];
 demeand_pri_lo_left_cond_one = [subj01_pll_one_demeaned subj02_pll_one_demeaned  subj03_pll_one_demeaned] % subj04_pll_one_demeaned];
 demeand_pri_lo_right_cond_one = [subj01_plr_one_demeaned subj02_plr_one_demeaned  subj03_plr_one_demeaned] % subj04_plr_one_demeaned];
 
 % concat group for condition two (l_spcs)
 demeand_pri_hi_left_cond_two = [subj01_phl_two_demeaned subj02_phl_two_demeaned  subj03_phl_two_demeaned] % subj04_phl_two_demeaned];
 demeand_pri_hi_right_cond_two = [subj01_phr_two_demeaned subj02_phr_two_demeaned  subj03_phr_two_demeaned] % subj04_phr_two_demeaned];
 demeand_pri_lo_left_cond_two = [subj01_pll_two_demeaned subj02_pll_two_demeaned  subj03_pll_two_demeaned] % subj04_pll_two_demeaned];
 demeand_pri_lo_right_cond_two = [subj01_plr_two_demeaned subj02_plr_two_demeaned  subj03_plr_two_demeaned] % subj04_plr_two_demeaned];
 
ipsi_one =  demeand_pri_lo_left_cond_one - demeand_pri_hi_left_cond_one
contra_one = demeand_pri_lo_right_cond_one -  demeand_pri_hi_right_cond_one
ipsi_two =  demeand_pri_lo_left_cond_two -  demeand_pri_hi_left_cond_two
contra_two = demeand_pri_lo_right_cond_two - demeand_pri_hi_right_cond_two

sem_ipsi_one = std(ipsi_one)/sqrt(length(ipsi_one))
sem_contra_one = std(contra_one)/sqrt(length(contra_one))
sem_ipsi_two = std(ipsi_two)/sqrt(length(ipsi_two))
sem_contra_two = std(contra_two)/sqrt(length(contra_two))

diff_vect = [sem_ipsi_one sem_contra_one sem_ipsi_two sem_ipsi_two]
 
 
 
 mean_demeand_pri_hi_left_cond_one = mean([subj01_phl_one_demeaned subj02_phl_one_demeaned  subj03_phl_one_demeaned]) % subj04_phl_one_demeaned]);
 mean_demeand_pri_hi_right_cond_one = mean([subj01_phr_one_demeaned subj02_phr_one_demeaned  subj03_phr_one_demeaned]) % subj04_phr_one_demeaned]);
 mean_demeand_pri_lo_left_cond_one = mean([subj01_pll_one_demeaned subj02_pll_one_demeaned  subj03_pll_one_demeaned]) % subj04_pll_one_demeaned]);
 mean_demeand_pri_lo_right_cond_one = mean([subj01_plr_one_demeaned subj02_plr_one_demeaned  subj03_plr_one_demeaned]) % subj04_plr_one_demeaned]);
 
 % concat group for condition one (pilot)
 mean_demeand_pri_hi_left_cond_two = mean([subj01_phl_two_demeaned subj02_phl_two_demeaned  subj03_phl_two_demeaned]) % subj04_phl_two_demeaned]);
 mean_demeand_pri_hi_right_cond_two = mean([subj01_phr_two_demeaned subj02_phr_two_demeaned  subj03_phr_two_demeaned]) % subj04_phr_two_demeaned]);
 mean_demeand_pri_lo_left_cond_two = mean([subj01_pll_two_demeaned subj02_pll_two_demeaned  subj03_pll_two_demeaned]) % subj04_pll_two_demeaned]);
 mean_demeand_pri_lo_right_cond_two = mean([subj01_plr_two_demeaned subj02_plr_two_demeaned  subj03_plr_two_demeaned]) % subj04_plr_two_demeaned]);
 
 %% plot demeaned means 
mean_demeaned_err = [mean_demeand_pri_hi_left_cond_one   mean_demeand_pri_lo_left_cond_one  mean_demeand_pri_hi_right_cond_one mean_demeand_pri_lo_right_cond_one...
mean_demeand_pri_hi_left_cond_two mean_demeand_pri_lo_left_cond_two mean_demeand_pri_hi_right_cond_two mean_demeand_pri_lo_right_cond_two]
hileftsemone = std(demeand_pri_hi_left_cond_one)/sqrt(length(demeand_pri_hi_left_cond_one))
hirightsemone = std(demeand_pri_hi_right_cond_one)/sqrt(length(demeand_pri_hi_right_cond_one))
loleftsemone = std(demeand_pri_lo_left_cond_one)/sqrt(length(demeand_pri_lo_left_cond_one))
lorightsemone = std(demeand_pri_lo_right_cond_one)/sqrt(length(demeand_pri_lo_right_cond_one))

hileftsemtwo = std(demeand_pri_hi_left_cond_two)/sqrt(length(demeand_pri_hi_left_cond_two))
hirightsemtwo= std(demeand_pri_hi_right_cond_two)/sqrt(length(demeand_pri_hi_right_cond_two))
loleftsemtwo = std(demeand_pri_lo_left_cond_two)/sqrt(length(demeand_pri_lo_left_cond_two))
lorightsemtwo = std(demeand_pri_lo_right_cond_two)/sqrt(length(demeand_pri_lo_right_cond_two))

 sem_vect= [hileftsemone  loleftsemone hirightsemone hirightsemtwo...
 hileftsemtwo loleftsemtwo lorightsemone lorightsemtwo]


figure(2);
subplot(1,2,1)
plot([1,2], [mean_demeand_pri_hi_left_cond_one  mean_demeand_pri_lo_left_cond_one],'o-','color', c1,'markersize',10,'MarkerEdgeColor', c1) %ipsi
hold on;
errorbar([mean_demeaned_err(1) mean_demeaned_err(2)] , [sem_vect(1) sem_vect(2)] ,'.')

plot([1,2], [mean_demeand_pri_hi_right_cond_one  mean_demeand_pri_lo_right_cond_one],'o--','color', c1,'markersize', 10,'MarkerEdgeColor', c1,'MarkerFaceColor', c1) %contra
hold on; 
errorbar([mean_demeaned_err(3) mean_demeaned_err(4)] , [sem_vect(3) sem_vect(4)] ,'.')
plot([1,2], [mean_demeand_pri_hi_left_cond_two  mean_demeand_pri_lo_left_cond_two],'o-','color', c13,'markersize',10,'MarkerEdgeColor', c13) %ipsi
hold on;
errorbar([mean_demeaned_err(5) mean_demeaned_err(6)] , [sem_vect(5) sem_vect(6)] ,'.')
plot([1,2], [mean_demeand_pri_hi_right_cond_two  mean_demeand_pri_lo_right_cond_two],'o--','color', c13,'markersize', 10,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
hold on;
errorbar([mean_demeaned_err(7) mean_demeaned_err(8)] , [sem_vect(7) sem_vect(8)] ,'.')


%  plot([1,2], [group_mean_hi_left(3)  group_mean_lo_left(3)],'o-','color', c13,'markersize',10,'MarkerEdgeColor', c13) %ipsi
%  hold on;
% 
% plot([1,2], [group_mean_hi_right(3)  group_mean_lo_right(3)],'o--','color', c13,'markersize', 10,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
errorbar(mean_demeaned_err, sem_vect,'.')
%ylim([0.75 2])

xlim([0 3])
xti = {'High Priority', 'Low Priority'}; 
set(gca, 'xtick', [1 2])
set(gca, 'xticklabel',  {'High Priority', 'Low Priority'})
legend('No TMS ipsi', 'No TMS contra', 'sPCS ipsi','sPCS contra')
set(gca, 'fontsize', 14)

%%
 

% hileftsemone = std(demeand_pri_hi_left_cond_one)/sqrt(length(demeand_pri_hi_left_cond_one))
% hirightsemone = std(demeand_pri_hi_right_cond_one)/sqrt(length(demeand_pri_hi_right_cond_one))
% loleftsemone = std(demeand_pri_lo_left_cond_one)/sqrt(length(demeand_pri_lo_left_cond_one))
% lorightsemone = std(demeand_pri_lo_right_cond_one)/sqrt(length(demeand_pri_lo_right_cond_one))
% 
% hileftsemtwo = std(demeand_pri_hi_left_cond_two)/sqrt(length(demeand_pri_hi_left_cond_two))
% hirightsemtwo= std(demeand_pri_hi_right_cond_two)/sqrt(length(demeand_pri_hi_right_cond_two))
% loleftsemtwo = std(demeand_pri_lo_left_cond_two)/sqrt(length(demeand_pri_lo_left_cond_two))
% lorightsemtwo = std(demeand_pri_lo_right_cond_two)/sqrt(length(demeand_pri_lo_right_cond_two))
% 
%  sem_vect= [hileftsemone hileftsemtwo hirightsemone hirightsemtwo...
%  loleftsemone loleftsemtwo lorightsemone lorightsemtwo]
 
 
 
for ii = 1:num_cond;
hileftsem(:,ii) = std(group_hi_left(:,ii))/sqrt(length(group_hi_left(:,ii)))
hirightsem(:,ii) = std(group_hi_right(:,ii))/sqrt(length(group_hi_right(:,ii)))
loleftsem(:,ii) = std(group_lo_left(:,ii))/sqrt(length(group_lo_left(:,ii)))
lorightsem(:,ii) = std(group_lo_right(:,ii))/sqrt(length(group_lo_right(:,ii)))
end 

% for ii = 1:3;
% hileftsem2(:,ii) = std(median_primary_err_hi_left_cond(:,ii))/sqrt(length(median_primary_err_hi_left_cond(:,ii)))
% hirightsem2(:,ii) = std(median_primary_err_hi_right_cond(:,ii))/sqrt(length(median_primary_err_hi_right_cond(:,ii)))
% loleftsem2(:,ii) = std(median_primary_err_lo_right_cond(:,ii))/sqrt(length(median_primary_err_lo_right_cond(:,ii)))
% lorightsem2(:,ii) = std(median_primary_err_lo_left_cond(:,ii))/sqrt(length(median_primary_err_lo_left_cond(:,ii)))
% end 


% 
sem_vect = [hileftsem(1) loleftsem(1) hirightsem(1) lorightsem(1)...
   hileftsem(2) loleftsem(2) hirightsem(2) lorightsem(2)];

a = [group_mean_hi_left(1) group_mean_lo_left(1) group_mean_hi_right(1) group_mean_lo_right(1)]; %ordering these in accordance with plotting 

b = [group_mean_hi_left(2) group_mean_lo_left(2) group_mean_hi_right(2)  group_mean_lo_right(2)];
%c = [group_mean_hi_left(3) group_mean_hi_right(3) group_mean_lo_left(3) group_mean_lo_right(3)];
%d = [group_mean_hi_left(4) group_mean_hi_right(4) group_mean_lo_left(4) group_mean_lo_right(4)];
%all_primary = [a b c d]; 
%all_primary = [a b c]; 
all_primary = [a b];

% figure(1)
% subplot(1,2,1)
% bar(1,all_primary(1),'Facecolor',parspec(1,:,:),'EdgeColor',[1 1 1]);
%     hold on;
% bar(2,all_primary(2),'Facecolor',parspec(2,:,:),'EdgeColor',[1 1 1]);
% bar(3,all_primary(3),'Facecolor',parspec(3,:,:),'EdgeColor',[1 1 1]); %make lighter 
% bar(4,all_primary(4),'Facecolor',parspec(4,:,:),'EdgeColor',[1 1 1]); %make lighter 
% bar(6,all_primary(5),'Facecolor',parspec(5,:,:),'EdgeColor',[1 1 1]);
% bar(7,all_primary(6),'Facecolor',parspec(6,:,:),'EdgeColor',[1 1 1]);
% bar(8,all_primary(7),'Facecolor',parspec(7,:,:),'EdgeColor',[1 1 1]); %make lighter 
% bar(9,all_primary(8),'Facecolor',parspec(8,:,:),'EdgeColor',[1 1 1]); %make lighter 
% bar(11,all_primary(9),'Facecolor',parspec(9,:,:),'EdgeColor',[1 1 1]);
% bar(12,all_primary(10),'Facecolor',parspec(10,:,:),'EdgeColor',[1 1 1]);
% bar(13,all_primary(11),'Facecolor',parspec(11,:,:),'EdgeColor',[1 1 1]); %make lighter 
% bar(14,all_primary(12),'Facecolor',parspec(12,:,:),'EdgeColor',[1 1 1]); %make lighter 
% % bar(16,all_primary(13),'Facecolor',parspec(13,:,:),'EdgeColor',[1 1 1]);
% % bar(17,all_primary(14),'Facecolor',parspec(14,:,:),'EdgeColor',[1 1 1]);
% % bar(18,all_primary(15),'Facecolor',parspec(15,:,:),'EdgeColor',[1 1 1]); %make lighter 
% % bar(19,all_primary(16),'Facecolor',parspec(16,:,:),'EdgeColor',[1 1 1]); %make lighter 
ylim([0 2.5])
xlabel ('Primary')
ylabel ('Error')
set(gca,'FontSize',14);
Labels = {'No TMS', 'Sham TMS', 'L IPS2', 'L sPCS'};
%set(gca,'XTick',[2.5 7.5 12.5 17.5],'XTickLabel',Labels)
xax = [1 2 3 4 6 7 8 9 11 12 13 14]


% bar_width=0.3412;
% bar(x(:,1),x(:,2),bar_width)

figure(1)
subplot(1,2,1)
bar(1,all_primary(1),'Facecolor',parspec(1,:,:),'EdgeColor','b','LineWidth',2);
    hold on;
bar(2,all_primary(2),'Facecolor',parspec(2,:,:),'EdgeColor','b','LineWidth',2);
bar(3,all_primary(3),'Facecolor',parspec(3,:,:),'EdgeColor','r','LineWidth',2); %make lighter 
bar(4,all_primary(4),'Facecolor',parspec(4,:,:),'EdgeColor','r','LineWidth',2); %make lighter 
bar(5,all_primary(5),'Facecolor',parspec(5,:,:),'EdgeColor','b','LineWidth',2);
bar(6,all_primary(6),'Facecolor',parspec(6,:,:),'EdgeColor','b','LineWidth',2);
bar(7,all_primary(7),'Facecolor',parspec(7,:,:),'EdgeColor','r','LineWidth',2); %make lighter 
bar(8,all_primary(8),'Facecolor',parspec(8,:,:),'EdgeColor','r','LineWidth',2); %make lighter 
% bar(9,all_primary(9),'Facecolor',parspec(9,:,:),'EdgeColor','b','LineWidth',2);
% bar(10,all_primary(10),'Facecolor',parspec(10,:,:),'EdgeColor','b','LineWidth',2);
% bar(11,all_primary(11),'Facecolor',parspec(11,:,:),'EdgeColor','r','LineWidth',2); %make lighter 
% bar(12,all_primary(12),'Facecolor',parspec(12,:,:),'EdgeColor','r','LineWidth',2); 
ylim([0 2.5])
xlim ([0 13])
errorbar(all_primary,sem_vect,'.','LineWidth',2)
ylim([0 2.5])
xlabel ('Primary')
ylabel ('Error (DVA)')
Labels = {'No TMS', 'L sPCS'};
xtick = [1:9];
set(gca, 'Xtick', xtick)
set(gca, 'xticklabel', Labels)
set(gca,'XTickLabelRotation',60)
set(gca,'FontSize',14);


%% regrouping by priority 
%goal: to plot median err by prioritization rather than condition (pilot,
%sham, lspcs)
% x axis will be high - low
%left right'
%condition one - no TMS
a = [group_mean_hi_left(1) group_mean_lo_left(1) group_mean_hi_right(1) group_mean_lo_right(1)]; %ordering these in accordance with plotting 

%condition two sPCS TMS
b = [group_mean_hi_left(2) group_mean_lo_left(2) group_mean_hi_right(2)  group_mean_lo_right(2)];

all_primary = [a b];




figure(2);
subplot(1,2,1)
plot([1,2], [group_mean_hi_left(1)  group_mean_lo_left(1)],'o-','color', c1,'markersize',14,'MarkerEdgeColor', c1) %ipsi
hold on;
errorbar([all_primary(1) all_primary(2)], [sem_vect(1) sem_vect(2)],'.')
plot([1,2], [group_mean_hi_right(1)  group_mean_lo_right(1)],'o--','color', c1,'markersize', 14,'MarkerEdgeColor', c1,'MarkerFaceColor', c1) %contra
hold on;
errorbar([all_primary(3) all_primary(4)], [sem_vect(3) sem_vect(4)],'.')
plot([1,2], [group_mean_hi_left(2)  group_mean_lo_left(2)],'o-','color', c13,'markersize',14,'MarkerEdgeColor', c13) %ipsi
hold on;
errorbar([all_primary(5) all_primary(6)], [sem_vect(5) sem_vect(6)],'.')
plot([1,2], [group_mean_hi_right(2)  group_mean_lo_right(2)],'o--','color', c13,'markersize', 14,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
hold on;
errorbar([all_primary(7) all_primary(8)], [sem_vect(7) sem_vect(8)],'.')
%  plot([1,2], [group_mean_hi_left(3)  group_mean_lo_left(3)],'o-','color', c13,'markersize',10,'MarkerEdgeColor', c13) %ipsi
%  hold on;
% 
% plot([1,2], [group_mean_hi_right(3)  group_mean_lo_right(3)],'o--','color', c13,'markersize', 10,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
% errorbar(all_primary, sem_vect,'.')

ylim([0.75 2])
xlim([0 3])
xti = {'High Priority', 'Low Priority'}; 
set(gca, 'xtick', [1 2])
set(gca, 'xticklabel',  {'High Priority', 'Low Priority'})
legend('No TMS ipsi', 'No TMS contra', 'sPCS ipsi','sPCS contra')
set(gca, 'fontsize', 14)

%% first year paper fig
figure; %cond one 
plot([1,2], [group_mean_hi_left(1)  group_mean_lo_left(1)],'o-','color', c1,'markersize',14,'MarkerEdgeColor', c1) %ipsi
hold on;
errorbar([group_mean_hi_left(1)  group_mean_lo_left(1)],[hileftsemone loleftsemone],'.')
plot([1,2], [group_mean_hi_right(1)  group_mean_lo_right(1)],'o--','color', c1,'markersize', 14,'MarkerEdgeColor', c1,'MarkerFaceColor', c1) %contra
hold on;
errorbar([group_mean_hi_right(1)  group_mean_lo_right(1)],[hirightsemone lorightsemone],'.')
%cond two
plot([1,2], [group_mean_hi_left(2) group_mean_lo_left(2)],'o-','color', c13,'markersize',14,'MarkerEdgeColor', c13) %ipsi
hold on;
errorbar([group_mean_hi_left(2)  group_mean_lo_left(2)],[hileftsemtwo hileftsemtwo],'.')
plot([1,2], [group_mean_hi_right(2)  group_mean_lo_right(2)],'o--','color', c13,'markersize',14,'MarkerEdgeColor', c13,'MarkerFaceColor', c13)
errorbar([group_mean_hi_right(2)  group_mean_lo_right(2)],[hirightsemtwo lorightsemtwo],'.')
%plot([1,2], [group_mean_hi_right(2)  group_mean_lo_right(2)],'o--','color', c8,'markersize', 10,'MarkerEdgeColor', c8,'MarkerFaceColor', c8) %contra
%  hold on;
%  hold on;
%  errorbar([group_mean_hi_left(3)  group_mean_lo_left(3)],[hileftsem(3) loleftsem(3)],'.')
% 
% plot([1,2], [group_mean_hi_right(2)  group_mean_lo_right(2)],'o--','color', c13,'markersize', 10,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
% errorbar([group_mean_hi_right(2)  group_mean_lo_right(2)],[hirightsem(2) lorightsem(2)],'.')
% errorbar(all_primary,sem_vect,'.','LineWidth',2)

ylim([1 2.5])
xlim([0 6])
xti = {'High Priority', 'Low Priority'}; 
set(gca, 'xtick', [1 2])
set(gca, 'xticklabel',  {'High Priority', 'Low Priority'})
legend('No TMS ipsi', 'No TMS contra', 'sPCS ipsi','sPCS contra')
set(gca, 'fontsize', 14)


%% plots with erroT bars
colors =[c1 c1 c3 c3 c13 c13 c15 c15];
figure(1)
subplot(2,1,1)
plot(1,all_primary(1),'o-','color', c1,'markersize', 12,'MarkerEdgeColor', c1)
hold on
%errorbar(all_primary(1), sem_vect(1),'.' ,'linewidth', 1.5, 'color', c1)
plot(2,all_primary(2),'o--','color', c1,'markersize', 12,'MarkerEdgeColor', c1,'MarkerFaceColor', c1)
%errorbar(all_primary(2), sem_vect(2),'.' ,'linewidth', 1.5, 'color', c1)
plot(3,all_primary(3),'o-','color', c3,'markersize', 12,'MarkerEdgeColor', c3) %make lighter
%errorbar(all_primary(3), sem_vect(3),'.' ,'linewidth', 1.5, 'color', c1)
plot(4,all_primary(4),'o--','color', c3,'markersize', 12,'MarkerEdgeColor', c3,'MarkerFaceColor', c3) %make lighter 
%errorbar(all_primary(4), sem_vect(4),'.' ,'linewidth', 1.5, 'color', c1)
plot(5,all_primary(5),'o-','color', c13,'markersize', 12,'MarkerEdgeColor', c13)
%errorbar(all_primary(5), sem_vect(5),'.' ,'linewidth', 1.5, 'color', c1)
plot(6,all_primary(6),'o--','color', c13,'markersize', 12,'MarkerEdgeColor', c13,'MarkerFaceColor', c13)
%errorbar(all_primary(6), sem_vect(6),'.' ,'linewidth', 1.5, 'color', c1)
plot(7,all_primary(7),'o-','color', c15,'markersize', 12,'MarkerEdgeColor', c15) %make lighter 
%errorbar(all_primary(7), sem_vect(7),'.' ,'linewidth', 1.5, 'color', c1)
plot(8,all_primary(8),'o--','color', c15,'markersize', 12,'MarkerEdgeColor', c15,'MarkerFaceColor', c15) %make lighter 
%errorbar(all_primary(8), sem_vect(8),'.' ,'linewidth', 1.5, 'color', c1)
% plot(9,all_primary(9),'o-','color', c9,'markersize', 12,'MarkerEdgeColor', c9)
% plot(10,all_primary(10),'o--','color', c9,'markersize', 12,'MarkerEdgeColor', c9,'MarkerFaceColor', c9)
% plot(11,all_primary(11),'o-','color', c11,'markersize', 12,'MarkerEdgeColor', c11) %make lighter 
% plot(12,all_primary(12),'o--','color', c11,'markersize', 12,'MarkerEdgeColor', c11,'MarkerFaceColor',c11) %make lighter 





errorbar(all_primary, sem_vect,'.' ,'linewidth', 1.5, 'color', c1)
set(gca, 'fontsize', 14)
ylim([0 2])
xlim([0 13])
legend('Hi No TMS ipsi', 'Hi No TMS contra','Lo No TMS ipsi', 'Lo No TMS contra', 'Hi sPCS ipsi','Hi sPCS contra','Lo sPCS ipsi','Lo sPCS contra')
%% get best subject

subj = {'subj03'};
%subj = {'subj01','subj02','subj03'};
cond  =  {'pilot'};
num_cond = length(cond);
num_subj = length(subj); 
for ss = 1:num_subj;
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_lo.mat',subj{ss},cond{cc});
        resultsfile = load(filename);
     primary_err_lo_left_cond_subj_pilot = resultsfile.ii_results_lo.no_break_left_primary_err_z_new;
        primary_err_lo_right_cond_subj_pilot = resultsfile.ii_results_lo.no_break_right_primary_err_z_new;
        
    end 
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_hi.mat',subj{ss},cond{cc});
        resultsfile = load(filename)
       primary_err_hi_left_cond_subj_pilot = resultsfile.ii_results_hi.no_break_left_primary_err_z_new;
       primary_err_hi_right_cond_subj_pilot = resultsfile.ii_results_hi.no_break_right_primary_err_z_new;
    end
end 

subj = {'subj03'};
%subj = {'subj01','subj02','subj03'};
cond  =  {'l_spcs'};

for ss = 1:num_subj;
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_lo.mat',subj{ss},cond{cc});
        resultsfile = load(filename);
     primary_err_lo_left_cond_subj_lspcs = resultsfile.ii_results_lo.no_break_left_primary_err_z_new;
        primary_err_lo_right_cond_subj_lspcs = resultsfile.ii_results_lo.no_break_right_primary_err_z_new;
        
    end 
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_hi.mat',subj{ss},cond{cc});
        resultsfile = load(filename)
       primary_err_hi_left_cond_subj_lspcs = resultsfile.ii_results_hi.no_break_left_primary_err_z_new;
       primary_err_hi_right_cond_subj_lspcs = resultsfile.ii_results_hi.no_break_right_primary_err_z_new;
    end


loleftspcs = std(primary_err_lo_left_cond_subj_lspcs)/sqrt(length(primary_err_lo_left_cond_subj_lspcs))
lorightspcs = std(primary_err_lo_right_cond_subj_lspcs)/sqrt(length(primary_err_lo_right_cond_subj_lspcs))
hileftspcs = std(primary_err_hi_left_cond_subj_lspcs)/sqrt(length(primary_err_hi_left_cond_subj_lspcs))
hirightspcs = std(primary_err_hi_right_cond_subj_lspcs)/sqrt(length(primary_err_hi_right_cond_subj_lspcs))

loleftpilot = std(primary_err_lo_left_cond_subj_pilot)/sqrt(length(primary_err_lo_left_cond_subj_pilot))
lorightpilot = std(primary_err_lo_right_cond_subj_pilot)/sqrt(length(primary_err_lo_right_cond_subj_pilot))
hileftpilot = std(primary_err_hi_left_cond_subj_pilot)/sqrt(length(primary_err_hi_left_cond_subj_pilot))
hirightpilot = std(primary_err_hi_right_cond_subj_pilot)/sqrt(length(primary_err_hi_right_cond_subj_pilot))

subj03sem = [loleftspcs  lorightspcs hileftspcs hirightspcs loleftpilot lorightpilot hileftpilot hirightpilot]
bs1 = [median_primary_err_hi_left_cond(1) median_primary_err_hi_right_cond(1)  median_primary_err_lo_left_cond(1) median_primary_err_lo_right_cond(1)] 
bs2 = [median_primary_err_hi_left_cond(2) median_primary_err_hi_right_cond(2)  median_primary_err_lo_left_cond(2) median_primary_err_lo_right_cond(2)] 
%hi_left_bs = median_primary_err_hi_left_cond(3,1)


all_bs =[bs1 bs2];
colors =[c1 c1 c3 c3 c13 c13 c15 c15];
figure(2)
subplot(3,1,3)
plot(1,all_bs(1),'o-','color', c1,'markersize', 12,'MarkerEdgeColor', c1)
hold on
plot(2,all_bs(2),'o--','color', c1,'markersize', 12,'MarkerEdgeColor', c1,'MarkerFaceColor', c1)

plot(3,all_bs(3),'o-','color', c3,'markersize', 12,'MarkerEdgeColor', c3) %make lighter

plot(4,all_bs(4),'o--','color', c3,'markersize', 12,'MarkerEdgeColor', c3,'MarkerFaceColor', c3) %make lighter 

plot(5,all_bs(5),'o-','color', c13,'markersize', 12,'MarkerEdgeColor', c13)

plot(6,all_bs(6),'o--','color', c13,'markersize', 12,'MarkerEdgeColor', c13,'MarkerFaceColor', c13)

plot(7,all_bs(7),'o-','color', c15,'markersize', 12,'MarkerEdgeColor', c15) %make lighter 

plot(8,all_bs(8),'o--','color', c15,'markersize', 12,'MarkerEdgeColor', c15,'MarkerFaceColor', c15) %make lighter 

ylim([0 2.5])
errorbar(all_bs,subj03sem,'.','LineWidth',1.5,'color',c1)

legend('Hi No TMS ipsi', 'Hi No TMS contra','Lo No TMS ipsi', 'Lo No TMS contra', 'Hi sPCS ipsi','Hi sPCS contra','Lo sPCS ipsi','Lo sPCS contra')
set(gca, 'fontsize', 14)
hold on
end 



%% get delta
notmsipsidelt = abs(group_mean_hi_left(1)-group_mean_lo_left(1))
notmscontradelt = abs(group_mean_hi_right(1)-group_mean_lo_right(1))
% shamipsidelt = abs(group_mean_hi_left(2)-group_mean_lo_left(2))
% shamcontradelt = abs(group_mean_hi_right(2)-group_mean_lo_right(2))
spcsipsidelt = abs(group_mean_hi_left(2)-group_mean_lo_left(2))
spcscontradelt = abs(group_mean_hi_right(2)-group_mean_lo_right(2))

notmsipsidelt = group_mean_lo_left(1)-group_mean_hi_left(1)
notmscontradelt = group_mean_lo_right(1)-group_mean_hi_right(1)
spcsipsidelt = group_mean_lo_left(2)-group_mean_hi_left(2)
spcscontradelt = group_mean_lo_right(2)-group_mean_hi_right(2)



figure;
bardelt = [notmsipsidelt notmscontradelt spcsipsidelt spcscontradelt];
bar(1, notmsipsidelt,'Facecolor',[1 1 1], 'EdgeColor', c1)
hold on;
bar(2, notmscontradelt,'Facecolor',c1)
hold on;
bar(3, spcsipsidelt,'Facecolor',[1 1 1], 'EdgeColor', c13)
bar(4, spcscontradelt,'Facecolor',c13)
errorbar(bardelt, diff_vect,'.')
colormap('summer')
sampsize = 3
df = 2
SD1 = hirightsem(1)
SD2 = hirightsem(2)
SDpooled = sqrt((SD1.^2 + SD2.^2)/2)
%smallsampcor = ((sampsize-3)/(sampsize -2.25)).* sqrt((sampsize-2)/sampsize) %wont work for 3 samples
g = Cohensd/(sqrt(sampsize/df)) %turns cohens d into hedge's g (still biased on small samples, but better estimator for small samples than cohens d)
Cohensd = (group_mean_hi_right (2) - group_mean_hi_right(1))/SDpooled %cohens d works for larger samples


legend('notmsipsidelt', 'notmscontradelt','spcsipsidelt','spcscontradelt'); 

%% mean difference btwn groups / by pooled std 


%%

%3 way anova
%anova_group = [mean(median_primary_err_hi_left_cond) mean(median_primary_err_hi_right_cond) mean(median_primary_err_lo_left_cond) mean(median_primary_err_lo_right_cond)]
 anova_group = [median_primary_err_hi_left_cond median_primary_err_hi_right_cond median_primary_err_lo_left_cond median_primary_err_lo_right_cond]
 anova_group = anova_group'
 anova_groupt = [anova_group(:,1); anova_group(:,2); anova_group(:,3)] 
% in this case, we flip the rows and columns to obtain each column as a
%subject
% stats setup
subject1 = {'subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1'};
subject2 = {'subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2'};
subject3 = {'subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3'};
subj = [subject1'; subject2'; subject3'];
priority = {'high';'high';'low';'low';         'high';'high';'low';'low';       'high';'high';'low';'low'}
hemi = {'left';'right';'left';'right';          'left';'right'; 'left'; 'right'; 'left'; 'right'; 'left'; 'right'}
condition = {'pilot';'pilot';'pilot'; 'pilot'; 'sham' ;'sham'; 'sham'; 'sham'; 'lspcs';'lspcs';'lspcs';'lspcs'}
priority = [priority; priority; priority]
hemi = [hemi; hemi;hemi];
condition = [condition; condition; condition];
[p tbl stats] = anovan(anova_groupt,{subj,priority,hemi,condition},'model','full','random', 1,'varnames',{'subj','priority','hemi','condition'});
%%
anova_group = [median_primary_err_hi_left_cond median_primary_err_hi_right_cond median_primary_err_lo_left_cond median_primary_err_lo_right_cond]
 anova_group = anova_group'
 anova_groupt = [anova_group(:,1); anova_group(:,2); anova_group(:,3); anova_group(:,4)] 
% in this case, we flip the rows and columns to obtain each column as a
%subject
% stats setup
%subject1 = {'subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1'};
subject1 = {'subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1'};
subject2 = {'subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2'};
%subject2 = {'subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2'};
%subject3 = {'subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3'};
subject3 = {'subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3'};
subject4 = {'subj4','subj4','subj4','subj4','subj4','subj4','subj4','subj4'};
subj = [subject1'; subject2'; subject3'; subject4';];
%priority = {'high';'high';'low';'low';         'high';'high';'low';'low';       'high';'high';'low';'low'}
priority = {'high';'high';'low';'low'; 'high';'high';'low';'low'}
%hemi = {'left';'right';'left';'right';          'left';'right'; 'left'; 'right'; 'left'; 'right'; 'left'; 'right'}
hemi = {'left';'right';'left';'right';  'left'; 'right'; 'left'; 'right'}
% condition = {'pilot';'pilot';'pilot'; 'pilot'; 'sham' ;'sham'; 'sham'; 'sham'; 'lspcs';'lspcs';'lspcs';'lspcs'}
condition = {'pilot';'pilot';'pilot'; 'pilot'; 'lspcs';'lspcs';'lspcs';'lspcs'}
priority = [priority; priority; priority; priority;]
hemi = [hemi;hemi;hemi;hemi;];
condition = [condition; condition;condition;condition;];
[p tbl stats] = anovan(anova_groupt,{subj,priority,hemi,condition},'model','full','random',1,'varnames',{'subj','priority','hemi','condition'})

%% FINAL 

subj = {'subj01','subj02','subj03'};
%subj = {'subj03'};
cond  =  {'pilot','l_spcs'}; %'l_ips2',
num_cond = length(cond);
num_subj = length(subj);  
median_final_err_lo_left_group = [];
median_final_err_lo_right_group =[];
median_final_err_hi_left_group = [];
median_final_err_hi_right_group = [];

for ss = 1:num_subj;
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_lo.mat',subj{ss},cond{cc});
        resultsfile = load(filename);
        median_final_err_lo_left_cond(ss,cc) = resultsfile.ii_results_lo.median_no_break_left_final_err_z_new;
        median_final_err_lo_right_cond(ss,cc) = resultsfile.ii_results_lo.median_no_break_right_final_err_z_new;
        group_lo_left_final(ss,cc) = [median_final_err_lo_left_group; resultsfile.ii_results_lo.median_no_break_left_final_err_z_new];
        group_lo_right_final(ss,cc) = [median_final_err_lo_right_group; resultsfile.ii_results_lo.median_no_break_right_final_err_z_new];
    end 
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_hi.mat',subj{ss},cond{cc});
        resultsfile = load(filename)
        median_final_err_hi_left_cond(ss,cc) = resultsfile.ii_results_hi.median_no_break_left_final_err_z_new;
        median_final_err_hi_right_cond(ss,cc) = resultsfile.ii_results_hi.median_no_break_right_final_err_z_new;
        group_hi_left_final(ss,cc) = [median_final_err_hi_left_group; resultsfile.ii_results_hi.median_no_break_left_final_err_z_new];
        group_hi_right_final(ss,cc) = [median_final_err_hi_right_group; resultsfile.ii_results_hi.median_no_break_right_final_err_z_new];
    end
end 

for ii = 1:num_cond;
    group_mean_hi_left_fin(ii) = mean(median_final_err_hi_left_cond(:,ii));
    group_mean_hi_right_fin(ii) = mean(median_final_err_hi_right_cond(:,ii));
    group_mean_lo_right_fin(ii) = mean(median_final_err_lo_right_cond(:,ii));
    group_mean_lo_left_fin(ii) = mean(median_final_err_lo_left_cond(:,ii));
end

% for ii = 1:num_cond;
%    [group_hi_left_final] = median_final_err_hi_left_cond(:,ii);
%     [group_hi_right_final] = median_final_err_hi_right_cond(:,ii);
%     [group_lo_left_final] = median_final_err_lo_right_cond(:,ii);
%     [group_lo_right_final] = median_final_err_lo_left_cond(:,ii);
% end


for ii =1:2;
hi_left_final_sem(:,ii) = std(group_hi_left_final(:,ii))/sqrt(length(group_hi_left_final(:,ii)))
hi_right_final_sem(:,ii) = std(group_hi_right_final(:,ii))/sqrt(length(group_hi_right_final(:,ii)))
lo_left_final_sem(:,ii) = std(group_lo_left_final(:,ii))/sqrt(length(group_lo_left_final(:,ii)))
lo_right_final_sem(:,ii) = std(group_lo_right_final(:,ii))/sqrt(length(group_lo_right_final(:,ii)))
end

sem_vect_final = [hi_left_final_sem hi_right_final_sem lo_left_final_sem lo_right_final_sem];


e = [group_mean_hi_left_fin(1) group_mean_hi_right_fin(1) group_mean_lo_left_fin(1) group_mean_lo_right_fin(1)];
f = [group_mean_hi_left_fin(2) group_mean_hi_right_fin(2) group_mean_lo_left_fin(2) group_mean_lo_right_fin(2)];
%g = [group_mean_hi_left(3) group_mean_hi_right(3) group_mean_lo_left(3) group_mean_lo_right(3)];
%h = [group_mean_hi_left(4) group_mean_hi_right(4) group_mean_lo_left(4) group_mean_lo_right(4)];

%all_final = [e f g h]; 

%all_final = [e f g]; 

all_final = [e f]; 

%%
for jj = 1:num_subj;
    subj_mean_fi_hi_left = mean(median_final_err_hi_left_cond,2)
    subj_mean_fi_hi_right = mean(median_final_err_hi_right_cond,2)
    subj_mean_fi_lo_left = mean(median_final_err_lo_left_cond,2)
    subj_mean_fi_lo_right = mean(median_final_err_lo_right_cond,2)
end

subj01_demeand = mean([subj_mean_fi_hi_left(1) subj_mean_fi_hi_right(1) subj_mean_fi_lo_left(1) subj_mean_fi_lo_right(1)]);
subj02_demeand = mean([subj_mean_fi_hi_left(2) subj_mean_fi_hi_right(2) subj_mean_fi_lo_left(2) subj_mean_fi_lo_right(2)]); 
subj03_demeand = mean([subj_mean_fi_hi_left(3) subj_mean_fi_hi_right(3) subj_mean_fi_lo_left(3) subj_mean_fi_lo_right(3)]);

%now substract these means from subject medians 
% 
 subj01_fhl_one_demeaned = median_final_err_hi_left_cond(1,1)- subj01_demeand;
 subj01_fhl_two_demeaned = median_final_err_hi_left_cond(1,2)- subj01_demeand;
 subj01_fhr_one_demeaned = median_final_err_hi_right_cond(1,1)- subj01_demeand;
 subj01_fhr_two_demeaned = median_final_err_hi_right_cond(1,2)- subj01_demeand;

 subj01_fll_one_demeaned = median_final_err_lo_left_cond(1,1)- subj01_demeand;
 subj01_fll_two_demeaned = median_final_err_lo_left_cond(1,2)- subj01_demeand;
 subj01_flr_one_demeaned = median_final_err_lo_right_cond(1,1)- subj01_demeand;
 subj01_flr_two_demeaned = median_final_err_lo_right_cond(1,2)- subj01_demeand;
 
 
 subj02_fhl_one_demeaned = median_final_err_hi_left_cond(2,1)- subj02_demeand;
 subj02_fhl_two_demeaned = median_final_err_hi_left_cond(2,2)- subj02_demeand;
 subj02_fhr_one_demeaned = median_final_err_hi_right_cond(2,1)- subj02_demeand;
 subj02_fhr_two_demeaned = median_final_err_hi_right_cond(2,2)- subj02_demeand;

 subj02_fll_one_demeaned = median_final_err_lo_left_cond(2,1)- subj02_demeand;
 subj02_fll_two_demeaned = median_final_err_lo_left_cond(2,2)- subj02_demeand;
 subj02_flr_one_demeaned = median_final_err_lo_right_cond(2,1)- subj02_demeand;
 subj02_flr_two_demeaned = median_final_err_lo_right_cond(2,2)- subj02_demeand;
 
 subj03_fhl_one_demeaned = median_final_err_hi_left_cond(3,1)- subj03_demeand;
 subj03_fhl_two_demeaned = median_final_err_hi_left_cond(3,2)- subj03_demeand;
 subj03_fhr_one_demeaned = median_final_err_hi_right_cond(3,1)- subj03_demeand;
 subj03_fhr_two_demeaned = median_final_err_hi_right_cond(3,2)- subj03_demeand;

 subj03_fll_one_demeaned = median_final_err_lo_left_cond(3,1)- subj03_demeand;
 subj03_fll_two_demeaned = median_final_err_lo_left_cond(3,2)- subj03_demeand;
 subj03_flr_one_demeaned = median_final_err_lo_right_cond(3,1)- subj03_demeand;
 subj03_flr_two_demeaned = median_final_err_lo_right_cond(3,2)- subj03_demeand;
 
 
 % concat group for condition one (pilot)
 demeand_fi_hi_left_cond_one = [subj01_fhl_one_demeaned subj02_fhl_one_demeaned  subj03_fhl_one_demeaned];
 demeand_fi_hi_right_cond_one = [subj01_fhr_one_demeaned subj02_fhr_one_demeaned  subj03_fhr_one_demeaned];
 demeand_fi_lo_left_cond_one = [subj01_fll_one_demeaned subj02_fll_one_demeaned  subj03_fll_one_demeaned];
 demeand_fi_lo_right_cond_one = [subj01_flr_one_demeaned subj02_flr_one_demeaned  subj03_flr_one_demeaned];
 
 % concat group for condition one (pilot)
 demeand_fi_hi_left_cond_two = [subj01_fhl_two_demeaned subj02_fhl_two_demeaned  subj03_fhl_two_demeaned];
 demeand_fi_hi_right_cond_two = [subj01_fhr_two_demeaned subj02_fhr_two_demeaned  subj03_fhr_two_demeaned];
 demeand_fi_lo_left_cond_two = [subj01_fll_two_demeaned subj02_fll_two_demeaned  subj03_fll_two_demeaned];
 demeand_fi_lo_right_cond_two = [subj01_flr_two_demeaned subj02_flr_two_demeaned  subj03_flr_two_demeaned];
 
 
 mean_demeand_fi_hi_left_cond_one = mean([subj01_fhl_one_demeaned subj02_fhl_one_demeaned  subj03_fhl_one_demeaned]);
 mean_demeand_fi_hi_right_cond_one = mean([subj01_fhr_one_demeaned subj02_fhr_one_demeaned  subj03_fhr_one_demeaned]);
 mean_demeand_fi_lo_left_cond_one = mean([subj01_fll_one_demeaned subj02_fll_one_demeaned  subj03_fll_one_demeaned]);
 mean_demeand_fi_lo_right_cond_one = mean([subj01_flr_one_demeaned subj02_flr_one_demeaned  subj03_flr_one_demeaned]);
 
 % concat group for condition one (pilot)
 mean_demeand_fi_hi_left_cond_two = mean([subj01_fhl_two_demeaned subj02_fhl_two_demeaned  subj03_fhl_two_demeaned]);
 mean_demeand_fi_hi_right_cond_two = mean([subj01_fhr_two_demeaned subj02_fhr_two_demeaned  subj03_fhr_two_demeaned]);
 mean_demeand_fi_lo_left_cond_two = mean([subj01_fll_two_demeaned subj02_fll_two_demeaned  subj03_fll_two_demeaned]);
 mean_demeand_fi_lo_right_cond_two = mean([subj01_flr_two_demeaned subj02_flr_two_demeaned  subj03_flr_two_demeaned]);
 
mean_demeaned_err = [mean_demeand_fi_hi_left_cond_one   mean_demeand_fi_lo_left_cond_one  mean_demeand_fi_hi_right_cond_one mean_demeand_fi_lo_right_cond_one...
mean_demeand_fi_hi_left_cond_two mean_demeand_fi_lo_left_cond_two mean_demeand_fi_hi_right_cond_two mean_demeand_fi_lo_right_cond_two]
hileftsemone = std(demeand_fi_hi_left_cond_one)/sqrt(length(demeand_fi_hi_left_cond_one))
hirightsemone = std(demeand_fi_hi_right_cond_one)/sqrt(length(demeand_fi_hi_right_cond_one))
loleftsemone = std(demeand_fi_lo_left_cond_one)/sqrt(length(demeand_fi_lo_left_cond_one))
lorightsemone = std(demeand_fi_lo_right_cond_one)/sqrt(length(demeand_fi_lo_right_cond_one))

hileftsemtwo = std(demeand_fi_hi_left_cond_two)/sqrt(length(demeand_fi_hi_left_cond_two))
hirightsemtwo= std(demeand_fi_hi_right_cond_two)/sqrt(length(demeand_fi_hi_right_cond_two))
loleftsemtwo = std(demeand_fi_lo_left_cond_two)/sqrt(length(demeand_fi_lo_left_cond_two))
lorightsemtwo = std(demeand_fi_lo_right_cond_two)/sqrt(length(demeand_fi_lo_right_cond_two))

 sem_vect_final = [hileftsemone  loleftsemone hirightsemone lorightsemone...
 hileftsemtwo loleftsemtwo lorightsemtwo lorightsemtwo]



e = [group_mean_hi_left_fin(1) group_mean_lo_left_fin(1) group_mean_hi_right_fin(1) group_mean_lo_right_fin(1)]; %ordering these in accordance with plotting 

f = [group_mean_hi_left_fin(2) group_mean_lo_left_fin(2) group_mean_hi_right_fin(2)  group_mean_lo_right_fin(2)];

all_final = [e f];



%%


% hold off
% figure(1)
% subplot(1,2,2)
% bar(1,all_final(1),'Facecolor',parspec(1,:,:),'EdgeColor','b','LineWidth',2);
%     hold on;
% bar(2,all_final(2),'Facecolor',parspec(2,:,:),'EdgeColor','b','LineWidth',2);
% bar(3,all_final(3),'Facecolor',parspec(3,:,:),'EdgeColor','r','LineWidth',2);
% bar(4,all_final(4),'Facecolor',parspec(4,:,:),'EdgeColor','r','LineWidth',2);
% bar(5,all_final(5),'Facecolor',parspec(5,:,:),'EdgeColor','b','LineWidth',2);
% bar(6,all_final(6),'Facecolor',parspec(6,:,:),'EdgeColor','b','LineWidth',2);
% bar(7,all_final(7),'Facecolor',parspec(7,:,:),'EdgeColor','r','LineWidth',2);
% bar(8,all_final(8),'Facecolor',parspec(8,:,:),'EdgeColor','r','LineWidth',2);
% bar(9,all_final(9),'Facecolor',parspec(9,:,:),'EdgeColor','b','LineWidth',2);
% bar(10,all_final(10),'Facecolor',parspec(10,:,:),'EdgeColor','b','LineWidth',2);
% bar(11,all_final(11),'Facecolor',parspec(11,:,:),'EdgeColor','r','LineWidth',2);
% bar(12,all_final(12),'Facecolor',parspec(12,:,:),'EdgeColor','r','LineWidth',2);
% % bar(16,all_final(13),'Facecolor',parspec(13,:,:),'EdgeColor',[1 1 1]);
% % bar(17,all_final(14),'Facecolor',parspec(14,:,:),'EdgeColor',[1 1 1]);
% % bar(18,all_final(15),'Facecolor',parspec(15,:,:),'EdgeColor',[1 1 1]);
% % bar(19,all_final(16),'Facecolor',parspec(16,:,:),'EdgeColor',[1 1 1]);
% xlabel ('Final')
% ylabel ('Error (DVA)')
% set(gca,'FontSize',14);
% Labels = {'No TMS', 'Sham TMS','L IPS2','L sPCS'};
% set(gca,'XTick',[2.5 7.5 12.5 17.5],'XTickLabel',Labels)
% ylim([0 2.5])
% xlim([0 9])
% errorbar(all_final,sem_vect_final,'.','LineWidth',2) 
%% plot as primary above 
figure(1);
subplot(1,2,2)
plot([1,2], [group_mean_hi_left_fin(1)  group_mean_lo_left_fin(1)],'o-','color', c1,'markersize',14,'MarkerEdgeColor', c1) %ipsi
hold on;
%errorbar([group_mean_hi_left(1)  group_mean_lo_left(1)],[hi_left_final_sem(1) lo_left_final_sem(1)],'.')
plot([1,2], [group_mean_hi_right_fin(1)  group_mean_lo_right_fin(1)],'o--','color', c1,'markersize', 14,'MarkerEdgeColor', c1,'MarkerFaceColor', c1) %contra
hold on;
%errorbar([group_mean_hi_right(1)  group_mean_lo_right(1)],[hi_right_final_sem(1) lo_right_final_sem(1)],'.')
% plot([1,2], [group_mean_hi_left(2)  group_mean_lo_left(2)],'o-','color', c8,'markersize',10,'MarkerEdgeColor', c8) %ipsi
% hold on;
% plot([1,2], [group_mean_hi_right(2)  group_mean_lo_right(2)],'o--','color', c8,'markersize', 10,'MarkerEdgeColor', c8,'MarkerFaceColor', c8) %contra
% hold on;
% plot([1,2], [group_mean_hi_left(2)  group_mean_lo_left(2)],'o-','color', c13,'markersize',10,'MarkerEdgeColor', c13) %ipsi
% hold on;
% errorbar([group_mean_hi_left(3)  group_mean_lo_left(3)],[hileftsem(3) loleftsem(3)],'.')
plot([1,2], [group_mean_hi_left_fin(2)  group_mean_lo_left_fin(2)],'o-','color', c13,'markersize',14,'MarkerEdgeColor', c13) %ipsi
plot([1,2], [group_mean_hi_right_fin(2)  group_mean_lo_right_fin(2)],'o--','color', c13,'markersize', 14,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
%errorbar([group_mean_hi_right(2)  group_mean_lo_right(2)],[hi_right_final_sem(2) lo_right_final_sem(2)],'.')
ylim([.75 1.5])
xlim([0 3])
xti = {'High Priority', 'Low Priority'}; 
set(gca, 'xtick', [1 2])
set(gca, 'xticklabel',  {'High Priority', 'Low Priority'})
legend('No TMS ipsi', 'No TMS contra', 'sPCS ipsi','sPCS contra')
set(gca, 'fontsize', 14)

%% plot 1,2 w error bars -- NOT stretched
figure(2); 
subplot (1,2,2)
plot([1,2], [group_mean_hi_left_fin(1)  group_mean_lo_left_fin(1)],'o-','color', c1,'markersize',14,'MarkerEdgeColor', c1) %ipsi
hold on;
errorbar([group_mean_hi_left_fin(1)  group_mean_lo_left_fin(1)],[hi_left_final_sem(1) lo_left_final_sem(1)],'.')
plot([1,2], [group_mean_hi_right_fin(1)  group_mean_lo_right_fin(1)],'o--','color', c1,'markersize', 14,'MarkerEdgeColor', c1,'MarkerFaceColor', c1) %contra
hold on;
errorbar([group_mean_hi_right_fin(1)  group_mean_lo_right_fin(1)],[hi_right_final_sem(1) lo_right_final_sem(1)],'.')
% plot([1,2], [group_mean_hi_left(2)  group_mean_lo_left(2)],'o-','color', c8,'markersize',10,'MarkerEdgeColor', c8) %ipsi
% hold on;
% plot([1,2], [group_mean_hi_right(2)  group_mean_lo_right(2)],'o--','color', c8,'markersize', 10,'MarkerEdgeColor', c8,'MarkerFaceColor', c8) %contra
% hold on;
 plot([1,2], [group_mean_hi_left_fin(2)  group_mean_lo_left_fin(2)],'o-','color', c13,'markersize',14,'MarkerEdgeColor', c13) %ipsi
 hold on;
 errorbar([group_mean_hi_left_fin(2)  group_mean_lo_left_fin(2)],[hi_left_final_sem(2) lo_left_final_sem(2)],'.')

plot([1,2], [group_mean_hi_right_fin(2)  group_mean_lo_right_fin(2)],'o--','color', c13,'markersize', 14,'MarkerEdgeColor', c13,'MarkerFaceColor', c13) %contra
errorbar([group_mean_hi_right_fin(2)  group_mean_lo_right_fin(2)],[hi_right_final_sem(2) lo_right_final_sem(2)],'.')
xlim([0 3])
ylim([0.075 2])
xti = {'High Priority', 'Low Priority'}; 
set(gca, 'xtick', [1 2])
set(gca, 'xticklabel',  {'High Priority', 'Low Priority'})
legend('No TMS ipsi', 'No TMS contra', 'sPCS ipsi','sPCS contra')
set(gca, 'fontsize', 14)
%%
%% get delta
notmsipsidelt = abs(group_mean_hi_left_fin(1)-group_mean_lo_left_fin(1))
notmscontradelt = abs(group_mean_hi_right_fin(1)-group_mean_lo_right_fin(1))
% shamipsidelt = abs(group_mean_hi_left(2)-group_mean_lo_left(2))
% shamcontradelt = abs(group_mean_hi_right(2)-group_mean_lo_right(2))
spcsipsidelt = abs(group_mean_hi_left_fin(2)-group_mean_lo_left_fin(2))
spcscontradelt = abs(group_mean_hi_right_fin(2)-group_mean_lo_right_fin(2))
figure;
bardelt = [notmsipsidelt notmscontradelt spcsipsidelt spcscontradelt];
bar(1, notmsipsidelt,'Facecolor',[1 1 1], 'EdgeColor', c1)
hold on;
bar(2, notmscontradelt,'Facecolor',c1)
hold on;
bar(3, spcsipsidelt,'Facecolor',[1 1 1], 'EdgeColor', c13)
bar(4, spcscontradelt,'Facecolor',c13)
%% plot stretched out
colors =[c1 c1 c3 c3 c13 c13 c15 c15];
figure(1)
subplot(2,1,1)
plot(1,all_final(1),'o-','color', c1,'markersize', 12,'MarkerEdgeColor', c1)
hold on
plot(2,all_final(2),'o--','color', c1,'markersize', 12,'MarkerEdgeColor', c1,'MarkerFaceColor', c1)
plot(3,all_final(3),'o-','color', c3,'markersize', 12,'MarkerEdgeColor', c3) %make lighter
plot(4,all_final(4),'o--','color', c3,'markersize', 12,'MarkerEdgeColor', c3,'MarkerFaceColor', c3) %make lighter 
plot(5,all_final(5),'o-','color', c13,'markersize', 12,'MarkerEdgeColor', c13)
plot(6,all_final(6),'o--','color', c13,'markersize', 12,'MarkerEdgeColor', c13,'MarkerFaceColor', c13)
plot(7,all_final(7),'o-','color', c15,'markersize', 12,'MarkerEdgeColor', c15) %make lighter 
plot(8,all_final(8),'o--','color', c15,'markersize', 12,'MarkerEdgeColor', c15,'MarkerFaceColor', c15) %make lighter 
errorbar(all_final, sem_vect_final,'.' ,'linewidth', 1.5, 'color', c1)
set(gca, 'fontsize', 14)
ylim([0.5 1.5])
xlim([0 9])
legend('Hi No TMS ipsi', 'Hi No TMS contra','Lo No TMS ipsi', 'Lo No TMS contra', 'Hi sPCS ipsi','Hi sPCS contra','Lo sPCS ipsi','Lo sPCS contra')


%% get best subject final 

subj = {'subj03'};
%subj = {'subj01','subj02','subj03'};
cond  =  {'pilot'};
num_cond = length(cond);
num_subj = length(subj); 
for ss = 1:num_subj;
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_lo.mat',subj{ss},cond{cc});
        resultsfile = load(filename);
     final_err_lo_left_cond_subj_pilot = resultsfile.ii_results_lo.no_break_left_final_err_z_new;
        final_err_lo_right_cond_subj_pilot = resultsfile.ii_results_lo.no_break_right_final_err_z_new;
        
    end 
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_hi.mat',subj{ss},cond{cc});
        resultsfile = load(filename)
       final_err_hi_left_cond_subj_pilot = resultsfile.ii_results_hi.no_break_left_final_err_z_new;
       final_err_hi_right_cond_subj_pilot = resultsfile.ii_results_hi.no_break_right_final_err_z_new;
    end
end 

subj = {'subj03'};
%subj = {'subj01','subj02','subj03'};
cond  =  {'l_spcs'};

for ss = 1:num_subj;
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_lo.mat',subj{ss},cond{cc});
        resultsfile = load(filename);
     final_err_lo_left_cond_subj_lspcs = resultsfile.ii_results_lo.no_break_left_final_err_z_new;
        final_err_lo_right_cond_subj_lspcs = resultsfile.ii_results_lo.no_break_right_final_err_z_new;
        
    end 
    for cc = 1:num_cond;
        filename = sprintf('/Volumes/hyper/experiments/Grace/tms_sessions/%s/%s/ii_results_hi.mat',subj{ss},cond{cc});
        resultsfile = load(filename)
       final_err_hi_left_cond_subj_lspcs = resultsfile.ii_results_hi.no_break_left_final_err_z_new;
       final_err_hi_right_cond_subj_lspcs = resultsfile.ii_results_hi.no_break_right_final_err_z_new;
    end


loleftspcsfinal = std(final_err_lo_left_cond_subj_lspcs)/sqrt(length(final_err_lo_left_cond_subj_lspcs))
lorightspcsfinal = std(final_err_lo_right_cond_subj_lspcs)/sqrt(length(final_err_lo_right_cond_subj_lspcs))
hileftspcsfinal = std(final_err_hi_left_cond_subj_lspcs)/sqrt(length(final_err_hi_left_cond_subj_lspcs))
hirightspcsfinal = std(final_err_hi_right_cond_subj_lspcs)/sqrt(length(final_err_hi_right_cond_subj_lspcs))

loleftpilotfinal = std(final_err_lo_left_cond_subj_pilot)/sqrt(length(final_err_lo_left_cond_subj_pilot))
lorightpilotfinal = std(final_err_lo_right_cond_subj_pilot)/sqrt(length(final_err_lo_right_cond_subj_pilot))
hileftpilotfinal = std(final_err_hi_left_cond_subj_pilot)/sqrt(length(final_err_hi_left_cond_subj_pilot))
hirightpilotfinal = std(final_err_hi_right_cond_subj_pilot)/sqrt(length(final_err_hi_right_cond_subj_pilot))

subj03semfinal = [loleftspcsfinal  lorightspcsfinal hileftspcsfinal hirightspcsfinal loleftpilotfinal lorightpilotfinal hileftpilotfinal hirightpilotfinal]
bs1 = [median_final_err_hi_left_cond(1) median_final_err_hi_right_cond(1)  median_final_err_lo_left_cond(1) median_final_err_lo_right_cond(1)] 
bs2 = [median_final_err_hi_left_cond(2) median_final_err_hi_right_cond(2)  median_final_err_lo_left_cond(2) median_final_err_lo_right_cond(2)] 
%hi_left_bs = median_final_err_hi_left_cond(3,1)


all_bs_final =[bs1 bs2];
colors =[c1 c1 c3 c3 c13 c13 c15 c15];
figure(2)

plot(1,all_bs_final(1),'o-','color', c1,'markersize', 12,'MarkerEdgeColor', c1)
hold on
plot(2,all_bs_final(2),'o--','color', c1,'markersize', 12,'MarkerEdgeColor', c1,'MarkerFaceColor', c1)

plot(3,all_bs_final(3),'o-','color', c3,'markersize', 12,'MarkerEdgeColor', c3) %make lighter

plot(4,all_bs_final(4),'o--','color', c3,'markersize', 12,'MarkerEdgeColor', c3,'MarkerFaceColor', c3) %make lighter 

plot(5,all_bs_final(5),'o-','color', c13,'markersize', 12,'MarkerEdgeColor', c13)

plot(6,all_bs_final(6),'o--','color', c13,'markersize', 12,'MarkerEdgeColor', c13,'MarkerFaceColor', c13)

plot(7,all_bs_final(7),'o-','color', c15,'markersize', 12,'MarkerEdgeColor', c15) %make lighter 

plot(8,all_bs_final(8),'o--','color', c15,'markersize', 12,'MarkerEdgeColor', c15,'MarkerFaceColor', c15) %make lighter 

ylim([0 2.5])
errorbar(all_bs_final,subj03semfinal,'.','LineWidth',1.5,'color',c1)

legend('Hi No TMS ipsi', 'Hi No TMS contra','Lo No TMS ipsi', 'Lo No TMS contra', 'Hi sPCS ipsi','Hi sPCS contra','Lo sPCS ipsi','Lo sPCS contra')
set(gca, 'fontsize', 14)
hold on
end 


%% no sham
anova_group = [median_final_err_hi_left_cond median_final_err_hi_right_cond median_final_err_lo_left_cond median_final_err_lo_right_cond]
 anova_group = anova_group'
 anova_groupt = [anova_group(:,1); anova_group(:,2); anova_group(:,3)] 
% in this case, we flip the rows and columns to obtain each column as a
%subject
% stats setup
subject1 = {'subj1','subj1','subj1','subj1','subj1','subj1','subj1','subj1'};
subject2 = {'subj2','subj2','subj2','subj2','subj2','subj2','subj2','subj2'};
subject3 = {'subj3','subj3','subj3','subj3','subj3','subj3','subj3','subj3'};
subject4 = {'subj4','subj4','subj4','subj4','subj4','subj4','subj4','subj4'};

subj = [subject1'; subject2'; subject3';subject4'];
priority = {'high';'high';'low';'low';         'high';'high';'low';'low';}
hemi = {'left';'right';'left';'right';          'left'; 'right'; 'left'; 'right'};
condition = {'pilot';'pilot';'pilot'; 'pilot';'lspcs';'lspcs';'lspcs';'lspcs'};
priority = [priority; priority; priority; priority]
hemi = [hemi;hemi;hemi;hemi];
condition = [condition; condition; condition; condition;];
[p tbl stats] = anovan(anova_groupt,{subj,priority,hemi,condition},'model','full','random',1,'varnames',{'subj','priority','hemi','condition'})