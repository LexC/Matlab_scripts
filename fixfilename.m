function fixfilename (oldstr,newstr,folderpath,filename)
% fixfilename (oldstr,newstr,folderpath,filename)
%
% this function changes unrecognizable characters of files names into
% recognizable ones and a specific string (oldstr) into a new one (newstr).
% 
% filename = Part or full name of the target file or files
% folderpath = the path of the folder that contains the wanted files
% oldstr = The string that you want to change in the filename
% newstr = The new string
%
% If the variable folderpath is not specificated, the function will act on
% the current folder. If the variables oldstr and newstr are not
% specificated, the function will only change the unrecognizable
% characters. 

clear list

%% valiables

if exist('folderpath','var')==1
    PATH=pwd;
    cd (folderpath)
end

if exist('filename','var')==1
    [~,b]=dirff(filename);
else
    [~,b]=dirff;
end

%% fixing variables
% transforme the struct b in cells

for i=1:size(b,2)
    list{i}=b(i).name;
end
%% changing characters

fullfile=list;

if exist('oldstr','var')==1 && exist('newstr','var')==1
    fullfile=strchange(fullfile,newstr,oldstr);
end

% Change space to nothing
fullfile=strchange(fullfile,'_');

%list of problematic characters
oldchar={'(';')';'!';'$';'&';'�';'#';'@';'�';'�';'�';
    '�';'~';'^';'�';'`';
    '+';'-';'=';'%';'�';'�';'�';'�';'�';
    '�';
    '�';'�';'�';'�';'�';'�';'�';'�';
    '�';'�';'�';'�';'�';'�';
    '�';'�';'�';'�';'�';'�';
    '�';'�';'�';'�';'�';'�';'�';'�';
    '�';'�';'�';'�';'�';'�'};
% The change of character will happing one to one
newchar={' ';' ';' ';' ';' ';' ';'_';'_';' ';' ';' ';
    ' ';' ';' ';' ';' ';
    '_';'_';'_';'_';'_';'_';'_';'_';'_';
    'c';
    'a';'a';'a';'a';'A';'A';'A';'A';
    'e';'e';'e';'E';'E';'E';
    'i';'i';'i';'I';'I';'I';
    'o';'o';'o';'o';'O';'O';'O';'O';
    'u';'u';'u';'U';'U';'U'};

%Change of the characters
for i=1:size(oldchar,1)
    fullfile=strchange(fullfile,newchar{i},oldchar{i});
end


%% Rewriting filename

for i=1:size(b,2)
    if isequal(list{i},fullfile{i})==0
        movefile(list{i},fullfile{i})
    end
end

if exist('PATH','var')==1
    cd (PATH)
end