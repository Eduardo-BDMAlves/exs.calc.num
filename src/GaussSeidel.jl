function gaussseidel(A,B, ϵ, max_inter)
    A=[A B]
    n=size(A,1)
    X=zeros(n,1)
    while ϵ > 1e-6
        for k in 1:max_inter
            matriz_atualiz=X
            for i in 1:n
                d=A[i,n+1]
                for j in 1:n
                    if j!=i
                        d= d - sum((A[i,1:j] * X[1:j]))
                    end
                    X[j]= d / A[i,i]
                end
            end
        end
    end
print(X)
end

