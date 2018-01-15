#Euler Modified Method Approximation of Integrals of type IVP

function f(x::Float64,y::Float64) ::Float64
	return (x^2+y)    
end

function modified_delta(a::Float64,b::Float64,η::Float64,a0::Float64)
	b = b - η
	T = collect(a:η:b)
	y1 = 0.0
	y0 = a0
	for i = T
	    #println("HELLO  $i")
	    k1 = η*f(i,y0)
	    k2 = η*f((i+η),(y0+k1))
	    y1 = y0 + 0.5*(k1+k2)
	    y0 = y1
	end 
	b = b + η
	println("Approximate value of y($b) is $y1")
end
#usage 
#to approximate y(x) given y(a) = k
#choose function f(x,y)
#choose ℏ
a = 0.0
y_a = 1.0
ℏ = 0.00001
x = 4.0
modified_delta(a,x,ℏ,y_a)