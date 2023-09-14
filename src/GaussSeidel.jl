using LinearAlgebra
"""
    gauss_seidel_mari(A,b, maxiter, ϵ, ω)

function that return x
x is defined by the operation A*x= b, get it by gauss seidel interaction method, where:
#Arguments 
A::type(array)= matrix 
b::type(vector)=vector 
maxiter::type(Float64)= max interaction possible 
ϵ::type(Float64)= tolerance
ω::type(Float64)= relaxed oscillation
#Example 
A=[ 2 1 ; 1 2 ]
b=[ 3 ; 3 ]
maxiter=1000
ϵ=1e-10
ω=1.0
X=[1.0000000000291038
0.9999999999854481]
"""
function gauss_seidel_mari(A, b; maxiter=100, ϵ=1e-10, ω=1.0)
    
    n = length(b)
    x = zeros(n)
    for iter in 1:maxiter
        x_old = copy(x)
        for i in 1:n
            σ = dot(A[i,1:i-1], x[1:i-1]) + dot(A[i,i+1:end], x_old[i+1:end])
            x[i] = (1 - ω) * x_old[i] + ω * (b[i] - σ) / A[i,i]
        end
        if norm(x - x_old) < ϵ
            return x
        end
    end
    return x
end
