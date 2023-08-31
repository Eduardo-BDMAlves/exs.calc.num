using LinearAlgebra
function gauss_seidel(A, b, max_iter, tol)
    n = length(b)
    x = zeros(n)
    e=0

    while e > tol
        for iter in 1:max_iter
            x_prev = copy(x)
        
            for i in 1:n
                sum_term = 0.0
            
                for j in 1:n
                    if j != i
                        sum_term += A[i, j] * x[j]
                    end
                end
            
                x[i] = (b[i] - sum_term) / A[i, i]
            end
        
        e=max(abs(x - x_prev)) 
        end
    end
return (x)
end        

