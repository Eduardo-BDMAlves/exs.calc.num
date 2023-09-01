using LinearAlgebra
function gauss_seidel(A, b; maxiter, ϵ=1e-10, ω)
    n = length(b)
    x = zeros(n)
    for iter in 1:maxiter
        x_old = copy(x)
        for i in 1:n
            σ = dot(A[i,1:i-1], x[1:i-1]) + dot(A[i,i+1:end], x_old[i+1:end])
            x[i] = (1 - ω) * x[i] + ω * (b[i] - σ) / A[i,i]
        end
        if norm(x - x_old) < ϵ
            return x
        end
    end
    return x
end