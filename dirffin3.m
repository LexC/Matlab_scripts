
function [ FOLDERS,FILES ] = dirffin3 (name,PATH_IN)
%  [ FOLDERS,FILES ] = dirff3 (name,PATH_IN))
% 
%   Retorna as pastas e os nomes dos arquivos, entrando em até 3 pastas.
% Se nas pastas não possuirem arquivos, FILES=FILES(1).name='None'
%%
if exist ('PATH_IN','var') == 1
    PATH_OUT=pwd;
    cd(PATH_IN)
end
%% SEM INPUT!
check=exist ('name','var');
if check == 0
%% INPUTS INICIAIS

Path=pwd;

[ folders,files] = dirff;

FOLDERS(1).name='None';
FILES(1).name='None';

u=1;
w=1;
%% PRIMEIRA PASTA
for i=1:size(folders,2)
    
    FOLDERS(u).name=fullfile(folders(i).name);
    u=u+1;
    
	if i<size(files,2)
        FILES(w).name=fullfile(files(i).name);
        w=w+1;
    end

    a=fullfile(Path,folders(i).name);
    
    cd(a)
    
    [ folders2,files2] = dirff;
    
	if strcmp (files2(1).name,'None')~=1
        for k=1:size(files2,2);
        FILES(w).name=fullfile(folders(i).name,files2(k).name);
            w=w+1;
        end
    end
    
    %% SEGUNDA PASTA
    if strcmp (folders2(1).name,'None')~=1
        for j=1:size(folders2,2);
            
            FOLDERS(u).name=fullfile(folders(i).name,folders2(j).name);
            u=u+1;
            
            b=fullfile(a,folders2(j).name);
    
            cd(b)
            
            [ folders3,files3] = dirff;
            
            if strcmp (files3(1).name,'None')~=1
                for k3=1:size(files3,2);
                    FILES(w).name=fullfile(folders(i).name,folders2(j).name,files3(k3).name);
                    w=w+1;
                end
            end
            
            %% TERCEIRA PASTA
            if strcmp (folders3(1).name,'None')~=1
                for j3=1:size(folders3,2);
                    
                    FOLDERS(u).name=fullfile(folders(i).name,folders2(j).name,folders3(j3).name);
                    u=u+1;
                    
                    c=fullfile(a,folders2(j).name,folders3(j3).name);

                    cd(c)

                    [ folders4,files4] = dirff;

                    if strcmp (files4(1).name,'None')~=1
                        for k4=1:size(files4,2);
                            FILES(w).name=fullfile(folders(i).name,folders2(j).name,folders3(j3).name,files4(k4).name);
                            w=w+1;
                        end
                    end

                    if strcmp (folders4(1).name,'None')~=1
                        for j4=1:size(folders4,2);

                            FOLDERS(u).name=fullfile(folders(i).name,folders2(j).name,folders3(j3).name,folders4(j4).name);
                            u=u+1;

                        end
                    end
                    
                end
            end
        end
    end
end

%% COMPLETANDO OS ARQUIVOS FALTANTES
if strcmp (files(1).name,'None')~=1
    for i=1:size(files,2)
        files_check{i}=files(i).name;
    end

    T1=table;
    T1.files=files_check';

    for i=1:size(FILES,2)
        FILES_check{i}=FILES(i).name;
    end

    T2=table;
    T2.files=FILES_check';

    A=ismember(T1,T2);

    for i=1:size(files,2)
        if A(i)==0
            FILES(w).name=files(i).name;
            w=w+1;
        end
    end
end

%% VOLTANDO PARA A PASTA INICIAL
cd(Path)

%% COM INPUT!

else
    %% INPUTS INICIAIS
Path=pwd;

[ folders,files] = dirff(name);


FOLDERS(1).name='None';
FILES(1).name='None';

u=1;
w=1;
i=1;
%% PRIMEIRA PASTA
for i=1:size(folders,2)
    
    FOLDERS(u).name=fullfile(folders(i).name);
    u=u+1;
    
	if i<size(files,2)
        FILES(w).name=fullfile(files(i).name);
        w=w+1;
    end

    a=fullfile(Path,folders(i).name);
    
    cd(a)
    
    [ folders2,files2] = dirff(name);
    
	if strcmp (files2(1).name,'None')~=1
        for k=1:size(files2,2);
        FILES(w).name=fullfile(folders(i).name,files2(k).name);
            w=w+1;
        end
    end
    
    %% SEGUNDA PASTA
    if strcmp (folders2(1).name,'None')~=1
        for j=1:size(folders2,2);
            
            FOLDERS(u).name=fullfile(folders(i).name,folders2(j).name);
            u=u+1;
            
            b=fullfile(a,folders2(j).name);
    
            cd(b)
            
            [ folders3,files3] = dirff(name);
            
            if strcmp (files3(1).name,'None')~=1
                for k3=1:size(files3,2);
                    FILES(w).name=fullfile(folders(i).name,folders2(j).name,files3(k3).name);
                    w=w+1;
                end
            end
            
            %% TERCEIRA PASTA
            if strcmp (folders3(1).name,'None')~=1
                for j3=1:size(folders3,2);
                    
                    FOLDERS(u).name=fullfile(folders(i).name,folders2(j).name,folders3(j3).name);
                    u=u+1;
                    
                    c=fullfile(a,folders2(j).name,folders3(j3).name);

                    cd(c)

                    [ folders4,files4] = dirff(name);

                    if strcmp (files4(1).name,'None')~=1
                        for k4=1:size(files4,2);
                            FILES(w).name=fullfile(folders(i).name,folders2(j).name,folders3(j3).name,files4(k4).name);
                            w=w+1;
                        end
                    end

                    if strcmp (folders4(1).name,'None')~=1
                        for j4=1:size(folders4,2);

                            FOLDERS(u).name=fullfile(folders(i).name,folders2(j).name,folders3(j3).name,folders4(j4).name);
                            u=u+1;

                        end
                    end
                    
                end
            end
        end
    end
end

%% COMPLETANDO OS ARQUIVOS FALTANTES
if strcmp (files(1).name,'None')~=1
    for i=1:size(files,2)
        files_check{i}=files(i).name;
    end

    T1=table;
    T1.files=files_check';

    for i=1:size(FILES,2)
        FILES_check{i}=FILES(i).name;
    end

    T2=table;
    T2.files=FILES_check';

    A=ismember(T1,T2);

    for i=1:size(files,2)
        if A(i)==0
            FILES(w).name=files(i).name;
            w=w+1;
        end
    end
end

%% VOLTANDO PARA A PASTA INICIAL
cd(Path)

end

if exist ('PATH_IN','var') == 1
	cd(PATH_OUT)
end

end