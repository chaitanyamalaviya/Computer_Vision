
function main()
inputstr = input();
SearchnPlaySegment(inputstr);
[y,Fs] = audioread('ch1_extracted.wav');
sound(y,Fs);
end

function inputstr = input()
prompt = {'Enter input text:'};
dlg_title = 'Input';
num_lines = 1;
def = {'What do you want Obama to say?'};
inputstr= inputdlg(prompt,dlg_title,num_lines,def);

end

function SearchnPlaySegment(inputstr)
buff = [];
FID = fopen('ch1.wrd', 'r');
if FID == -1, error('Cannot open file'), end
%Data = textscan(FID, '%s', 'delimiter', '\n', 'whitespace', '');
%CStr = Data{1};

segs = textscan(inputstr{1},'%s');
C = textscan(FID,'%s %s %s');
fclose(FID);

seg1 = segs{1};

for j = 1:length(seg1)
    seg = seg1{j};
    for i = 1 : 5260      
        if  strcmpi(C{3}{i},seg)==1
            startpos = C{1}{i};
            endpos = C{2}{i}; 
        end
    end

    [y, Fs] = audioread('ch1.wav');
    startpos = round(str2double(startpos)*Fs)+1;
    endpos = round(str2double(endpos)*Fs)+1;
    %Play the segment
    
    [y3, Fs] = audioread('ch1.wav', [startpos,endpos]);
    buff = [buff; y3(:)];
    clear y3;

   % [y3, Fs] = audioread('ch1.wav', [startpos,endpos]);
    audiowrite('ch1_extracted.wav',buff,Fs);

        
    end        
end