close all
clear
clc
%% Variables

loc{1}='D:\GD_UNICAMP\IC_NeuroFisica\Projetos\Coleta_NIRS_fMRI_2015-2017\Processed_data\fMRI\Protocolo_01\Patients\Processed';
loc{2}='D:\GD_UNICAMP\IC_NeuroFisica\Projetos\Coleta_NIRS_fMRI_2015-2017\Processed_data\fMRI\Protocolo_02\Patients\Processed';
loc{3}='D:\GD_UNICAMP\IC_NeuroFisica\Projetos\Coleta_NIRS_fMRI_2015-2017\Processed_data\fMRI\Protocolo_02\Volunteers\Processed';

%%
u=1;
for i=1:size(loc,2)
    %%
    cd(loc{i})
    
    [~,b]=dirff3('Matrix-VAR.mat');
    %%
    for j=1:size(b,2)
        %%
        c=strsplit(loc{i},'Protocolo_');
        c=strsplit(c{2},'\');
        c=str2num(c{1});
       
        CorrMat(u).Protocolo=c;
        %%
        c=strsplit(loc{i},'\');
        c=c{end-1};
        c=c(1:(end-1));
        
        CorrMat(u).Type=c;
        %%
        c=strsplit(b(j).name,'\');
        c=strsplit(c{2},'_');
        
        CorrMat(u).Subject=str2num(c{3});
        CorrMat(u).Run=str2num(c{4});
        %%
        load(b(j).name)
        CorrMat(u).map=map;
        u=u+1;
    end
end
%%

cd('D:\GD_UNICAMP\IC_NeuroFisica\Projetos\Coleta_NIRS_fMRI_2015-2017\Processed_data\fMRI')
save('CorrMat.mat','CorrMat')
