function [ folders,files ] = dirffin (folders_in,PATH_IN,name)
%
% [ folders,files ] = dirffin3 (foldersin,PATH_IN,name)
% 
% Returns all the names of folders and files of a folder and it's
% subfolders.
%
%   Explaning variables
% 
% folders: a cell type with folders names.
%     If there is no folders:
%         folders=folders{1}='None'
% files: is a cell type with files names.
%     If there is no files:
%         files=files{1}='None'
% 
% folders_in: Number of intended subfolders.
% PATH_IN: to change the wanted location
% name: lists files that match with it

%% Head

% Changing folder
PATH_OUT=pwd;
if exist ('PATH_IN','var') == 1
    cd(PATH_IN)
end

% Variables

if exist('name','var')==0
    [ folders,files] = dirff(1);
else
    [ folders,files] = dirff(1,pwd,name);
end
% If there are no subfolders content, stops the script
if isequal(folders,{'None'})==1
    return
end

pathsize=size(strsplit(folders{1},'\'),2)+folders_in;
folders_in_check=size(strsplit(folders{1},'\'),2);
%% Body

u=1;
while folders_in_check < pathsize
    for i=u:size(folders,1)
        %%
        cd(folders{i})

        if exist('name','var')==0
            [ folders1,files1] = dirff(1);
        else
            [ folders1,files1] = dirff(1,pwd,name);
        end

        if isequal(folders1,{'None'})==0
            folders=[folders;folders1];
        else
            break
        end
        if isequal(files1,{'None'})==0
            files=[files;files1];
        end
    end
    folders_in_check=size(strsplit(folders{end},'\'),2);
    u=i+1;
end
%% Foot

folders=sort(folders);
files=sort(files);

% changing the folders back to the original location
cd(PATH_OUT)

end