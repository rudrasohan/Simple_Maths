A = rand(100,100)
B = rand(100, 100)
C = rand(100, 100)

using BenchmarkTools

function inner_rows!(C, A, B)
    for i in 1:100, j in 1:100
        C[i, j] = A[i, j] + B[i, j]
    end
end

function inner_cols!(C, A, B) # julia is inherently column major
    for j in 1:100, i in 1:100
        C[i, j] = A[i, j] + B[i, j]
    end
end

@btime inner_rows!(C, A, B)
@btime inner_cols!(C, A, B)