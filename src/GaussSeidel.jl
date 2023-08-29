using LinearAlgebra
function gaussseidel(A,B, x0, ϵ, max_inter)
    n=size(A)
    x=x0
        for i in 1:max_inter
            matriz_atualiz=zeros(n)
            for j in 1:n
                s1=dot(A[j,j],matriz_atualiz[1,1:j])
                s2= dot(A[j,j+1],x[j + 1])
                matriz_atualiz[j]=(b[j]-s1-s2)/A[j,j]
                if isapprox(x,matriz_atualiz)
                    println(matriz_atualiz)
                else 
                    println("isso deu merda")
                end
            end
        end
end