using DrWatson, Test
@quickactivate "exercícios 2"
using IterativeSolvers
include(srcdir("GaussSeidel.jl"))

# Run test suite
println("Starting tests")
ti = time()

@testset "exercícios 2 tests" begin
    @test 1 == 1
end


@testset "Gauss-Seidel" begin
    ## Implementar testes
    A_test = rand(3,3)
    B_test = rand(3)

    x_package = gauss_seidel(A_test,B_test)
    x_mari = gauss_seidel_mari(A_test,B_test,maxiter=10)

    @test x_package ≈ x_mari

    A_test=[1 0 0; 0 1 0; 0 0 1]
    B_test=[12; 5; 9]

    x_package= gauss_seidel(A_test,B_test)
    x_mari=gauss_seidel_mari(A_test,B_test,maxiter=10)
    
    @test x_package ≈ x_mari

    A_test=[25 5 1; 64 8 1; 144 12 1]
    B_test=[106.8; 177.2; 279.2]

    x_package= gauss_seidel(A_test,B_test)
    x_mari= gauss_seidel_mari(A_test,B_test, maxiter=10)
    @test x_package ≈ x_mari


    A_test=[12 3 -5; 1 5 3; 3 7 13]
    B_test=[1; 28; 76]

    x_package=gauss_seidel(A_test,B_test)
    x_mari= gauss_seidel_mari(A_test,B_test,maxiter=10)
    @test  x_package ≈ x_mari

    A_test= [4 -1 -1 ; -2 6 1 ; -1 1 7]
    B_test=[3; 9; -6]
    x_mari= gauss_seidel_mari(A_test,B_test,maxiter=10)
    x_package= gauss_seidel(A_test,B_test)

    @test  x_package ≈ x_mari

    A_test=rand(10,10)
    B_test = rand(10)
    x_package = gauss_seidel(A_test,B_test)
    x_mari = gauss_seidel_mari(A_test,B_test,maxiter=10)
   
    @test  x_package ≈ x_mari

    A_test=[12 3 -5; 1 5 3; 3 7 13]
    B_test = [1; 28 ; 76]
    x_package = gauss_seidel(A_test,B_test)
    x_mari = gauss_seidel_mari(A_test,B_test,maxiter=10)
   
    @test  x_package ≈ x_mari
    
end




ti = time() - ti
println("\nTest took total time of:")
println(round(ti/60, digits = 3), " minutes")
