A=[2 1 3 5 ; 1 2 7 8 ; 3 4 9 5; (π) 2*(π) (ℯ) (ℯ)^(π) ]
B=[ 3; 5; 7.5; 8]
using LinearAlgebra
    X= A \ B

A = [21.0   -15.0     38.0         1.0
3.47   29.003    π     7.0
0.0     3.0    -55.0      -121.0
2.0     0.0     -4.0        99.0]
B = [7.0
-18.0
 42.0
 13.0]

using DrWatson
@quickactivate

include(srcdir("GaussSeidel.jl"))


gauss_seidel(A,B)
gauss_seidel_mari(A,B,maxiter=10)
