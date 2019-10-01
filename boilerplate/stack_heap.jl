A = rand(100,100)
B = rand(100, 100)
C = rand(100, 100)

using BenchmarkTools

function inner_alloc!(C, A, B) 
    for j in 1:100, i in 1:100
        val = [A[i, j] + B[i, j]] #heap allocation
        C[i, j] = val[1]
    end
end

function inner_noalloc!(C, A, B) 
    for j in 1:100, i in 1:100
        val = A[i, j] + B[i, j] #fixed size floa64 allocation
        C[i, j] = val[1]
    end
end

using StaticArrays

function static_inner_alloc!(C, A, B)
    for j in 1:100, i in 1:100
        val = @SVector [A[i, j] + B[i, j]] #static size allocated array
        C[i, j] = val[1]
    end
end


@btime inner_alloc!(C, A, B)
@btime inner_noalloc!(C, A, B)
@btime static_inner_alloc!(C, A, B)