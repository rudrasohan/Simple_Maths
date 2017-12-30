#approximate eigen vectors

function simplest_ratio(x::Array{Float64,2},r::Int64)
	𝑛 = x[1]
	for i = 2:r
		if 𝑛 > x[i]
			𝑛 = x[i]
		end
	end
	x = x/𝑛 
    return(x)
end

function approx_eigen_vector(M::Array{Int64,2},η::Int64)
	r,_ = size(M)
	w = rand(r,1)
	λ = w
	for i = 1:η
		λ = M * w
		w = λ
	end
	λ = simplest_ratio(λ,r)
	println(λ)
	return λ
end

a = [2 1;1 1]
n = 100
approx_eigen_vector(a,n)