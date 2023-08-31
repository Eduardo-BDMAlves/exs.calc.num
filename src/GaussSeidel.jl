using LinearAlgebra
function gaussseidel(A,B, ϵ, max_inter)
    n=size(A)
    X=zeros(n,1)
    while ϵ> 1e-6
        for k in 1:max_inter
            matriz_atualiz=X
            for i in 1:n
                soma=A[i,(i+1:n)]*X[(i+1):n]
                X[i,1]= (A[i,n+1]- soma)/A[i,i]
            end
            ϵ=max(abs(X-matriz_atualiz))
            k=k+1
        end
        println(X)
    end
end
