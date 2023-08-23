A= [2 1 3 5 ; 1 2 7 8 ; 3 4 9 5; (π) 2*(π) (ℯ) (ℯ)^(π) ] #matriz A 
B=[ 3; 5; 7.5; 8] #Matriz B
# Método de eliminação de Gauss
function fgauss(A::Array, B::Array)
    matriz_expandida= [ A B ]
    print(matriz_expandida)
    tamanho_matriz= size(matriz_expandida,1)
    for k in 1 : tamanho_matriz-1
        for i in k+1 : tamanho_matriz
                aux= matriz_expandida[i,k]/matriz_expandida[k,k]
                matriz_expandida[i,k]=0
                for j in k+1 : tamanho_matriz+1
                    matriz_expandida[i,j]=matriz_expandida[i,j] - (aux * matriz_expandida[k,j])
                end            
        end
    end
    println(matriz_expandida) 
    #X=rand[0, tamanho_matriz , 1]
    #println(X)
    #X=[0,0,0,0]
    for i in 1: tamanho_matriz
        aux2= (matriz_expandida[i,end]/matriz_expandida[i,i])
        println(aux2)
    end
    #for i in tamanho_matriz-1:1:-1
     #   somatorio=0
      #  for j in i+1 : tamanho_matriz
       #     somatorio= somatorio + matriz_expandida[i,j] * X[j,1]
        #    println(somatorio)
        #end
    #X[i,1]=(matriz_expandida[i, tamanho_matriz+1]-somatorio)/ matriz_expandida[i,i]
    #end
#println(X)
end