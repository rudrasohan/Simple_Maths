#Baysian approx square root finding
function approx_square_root(x::Int64,ƞ::Int64) ::Float32
	x0 = x/2.
	x_0 = Float32(x0)
	x_1 = 0.0
	for i = 1:ƞ
		x_1 = 1/2.*(x_0+x/x_0)
		x_0 = x_1
	end
	ϵ = (abs(x_1 - sqrt(x)))
	println("The approx aquare root = $x_1")
	println("error = $ϵ")
	return x_1
end

#println("Enter a number and the number of iterations")
α = 12#read(STDIN, Int64)
ν = 5#read(STDIN, Int64)
k = 0.0
k = approx_square_root(α,ν);
println("$k")
#approx_square_root(12,1000);