function [ folders,files] = dirff (name)
% Retorna os nomes dos aquivos e pastas do local.
% 
% [ folders,files] = dirff (name)
% 
% Se não houver arquivos
%	files=files(1).name='None'
% Se não houver pastas
%	folders=folders(1).name='None'

%% Variables

A=dir;
u=1;
k=1;

folders(1).name='None';
files(1).name='None';

%% 

if exist ('name','var') == 0 

        for i=1:size(A,1)
            if isequal (A(i).name,'.') ~=1 && isequal (A(i).name,'..') ~=1
                check=exist (A(i).name);
                if check == 7
                    folders(u).name=A(i).name;
                    u=u+1;
                elseif check == 2 || check == 6
                    files(k).name=A(i).name;
                    k=k+1;
                end
            end
        end

%% 
else
    %% FOLDERS
    
    for i=1:size(A,1)

        if isequal (A(i).name,'.') ~=1 && isequal (A(i).name,'..') ~=1
            if exist (A(i).name,'dir') == 7
                folders(u).name=A(i).name;
                u=u+1;
            end
        end

    end

    %% FILES

	B=dir(name);

    for i=1:size(B,1)
        files(k).name=B(i).name;
        k=k+1;
    end
    
end