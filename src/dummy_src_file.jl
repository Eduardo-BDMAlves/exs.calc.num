A= [2 1 3 5 ; 1 2 7 8 ; 3 4 9 5; (π) 2*(π) (ℯ) (ℯ)^(π) ] #matriz A 
B=[ 3; 5; 7.5; 8] #Matriz B
# Método de eliminação de Gauss
function fgauss(A::Array, B::Array)
    matriz_expandida= [ A B ]
    tamanho_matriz= size(matriz_expandida,1)
    println(tamanho_matriz)
    for i in 1 : tamanho_matriz-1
        dividendo= matriz_expandida[i,i]
        for j in i+1 : tamanho_matriz
                aux= matriz_expandida[j,i]/dividendo
                matriz_expandida[j,:]=matriz_expandida[j,:]- (aux .*matriz_expandida[i,:])
            
            
        end
    end
    println(matriz_expandida) 
    X=
    X[1,tamanho_matriz] = matriz_expandida[tamanho_matriz,tamanho_matriz+1]/ matriz_expandida[tamanho_matriz,tamanho_matriz]
    for i in tamanho_matriz-1:1:-1
        somatorio=0
        for j in i+1 : tamanho_matriz
            somatorio= somatorio + matriz_expandida[i,j] * X[j,1]
        end
    X[i,1]=(matriz_expandida[i, tamanho_matriz+1]-somatorio)/ matriz_expandida[i,i]
    end
println(X)
end