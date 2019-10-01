A = rand(100,100)
B = rand(100, 100)
C = rand(100, 100)

using BenchmarkTools

function unfused(A, B, C)
    tmp = A .+ B
    tmp .+ C    
end

fused(A, B, C) = A .+ B .+ C

fused!(D, A, B, C) = (D .= A .+ B .+ C)

D = similar(C)

@btime fused!(D,A,B,C)
@btime fused(A,B,C)
@btime unfused(A,B,C)