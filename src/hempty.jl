function hempty(A::HMat2d)
    C = HMat2d()
    C.height = A.height
    C.width = A.width
    C.trg = A.trg
    C.src = A.src
    C.level = A.level

    C.EPS = A.EPS
    C.MAXRANK = A.MAXRANK
    C.MINN = A.MINN

    if A.blockType == "LOWRANK"
        C.blockType = "LOWRANK"
        C.UMat = zeros(C.height,0)
        C.VMat = zeros(C.width,0)
    elseif A.blockType == "DENSE"
        C.blockType = "DENSE"
        C.DMat = spzeros(C.height,C.width)
    elseif A.blockType == "HMAT"
        C.blockType = "HMAT"
        C.childHMat = Array(HMat2d,4,4)
        for i = 1:4
            for j = 1:4
                C.childHMat[i,j] = hcopy(A.childHMat[i,j])
            end
        end
    end
    return C
end
