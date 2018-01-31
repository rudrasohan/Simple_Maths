#Runge-Kutta Method Approximation of Integrals of type IVP

function f(t::Float64,u::Float64,v::Float64) ::Float64
	return v    
end

function g(t::Float64,u::Float64,v::Float64) ::Float64
    return u + t*v
end

function solver_delta(a::Float64,b::Float64,η::Float64,a0::Float64,a1::Float64)
	b = b - η
	T = collect(a:η:b)
	y1 = 0.0
	y0 = a0
	y1 = a1
	for i = T
	    #println("HELLO  $i")
	    k1 = η*f(i,y0,y1)
	    l1 = η*g(i,y0,y1)
	    k2 = η*f((i+η/2),(y0+k1/2),(y1+l1/2))
	    l2 = η*g((i+η/2),(y0+k1/2),(y1+l1/2))
	    k3 = η*f((i+η/2),(y0+k2/2),(y1+l2/2))
	    l3 = η*g((i+η/2),(y0+k2/2),(y1+l2/2))
	    k4 = η*f((i+η),(y0+k3),(y1+l3))
	    l4 = η*g((i+η),(y0+k3),(y1+l3))
	    y0_1 = y0 + 1/6.0*(k1+2*k2+2*k3+k4)
	    y1_1 = y1 + 1/6.0*(l1+2*l2+2*l3+l4)
	    y0 = y0_1
	    y1 = y1_1
	end 
	b = b + η
	println("Approximate value of y($b) is $y1")
end
#usage 
#to approximate y(x) given y(a) = k
#choose function f(x,y)
#choose ℏ
a = 0.0
y_a_0 = 0.0
y_a_1 = 0.1
ℏ = 0.1
x = 0.2
solver_delta(a,x,ℏ,y_a_0,y_a_1)