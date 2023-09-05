using DrWatson, Test
@quickactivate "exercícios 2"
using IterativeSolvers
# Here you include files using `srcdir`
# include(srcdir("file.jl"))
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

end




ti = time() - ti
println("\nTest took total time of:")
println(round(ti/60, digits = 3), " minutes")
