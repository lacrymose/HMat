function C = hcopy(A)
    if A.blockType == 'L'
        UMat = A.UMat;
        VMat = A.VMat;
        C = struct('height',A.height,'width',A.width,...
                    'level',A.level,...
                    'trg',A.trg, 'src',A.src,...
                    'blockType',A.blockType,...
                    'UMat',UMat, 'VMat',VMat,...
                    'EPS',A.EPS, 'MAXRANK',A.MAXRANK, 'MINN',A.MINN);
    elseif A.blockType == 'D'
        DMat = A.DMat;
        C = struct('height',A.height,'width',A.width,...
                    'level',A.level,...
                    'trg',A.trg, 'src',A.src,...
                    'blockType',A.blockType,...
                    'DMat',DMat,...
                    'EPS',A.EPS, 'MAXRANK',A.MAXRANK, 'MINN',A.MINN);
    elseif A.blockType == 'H'
        childHMat = cell(4,4);
        for i = 1:4
            for j = 1:4
                childHMat{i,j} = hcopy(A.childHMat{i,j});
            end
        end
        C = struct('height',A.height,'width',A.width,...
                    'level',A.level,...
                    'trg',A.trg, 'src',A.src,...
                    'blockType',A.blockType,...
                    'childHMat',{childHMat},...
                    'EPS',A.EPS, 'MAXRANK',A.MAXRANK, 'MINN',A.MINN);
    end
end