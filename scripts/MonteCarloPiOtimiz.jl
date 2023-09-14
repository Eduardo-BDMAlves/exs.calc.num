using DrWatson
@quickactivate 
include(srcdir("monte_carlo_pi.jl"))
using Random
using LinearAlgebra
n=10
pi_estimate, x_inside, y_inside, x_outside, y_outside, lista=monte_carlo_pi(n)
function monte_carlo_pi_otimiz(n,lista)
    inside = 0
    num=size(lista)
    x_inside = lista[(1):(num/4)] 
    y_inside = lista[(num/4):(num/3)]
    x_outside = lista[(num/3):(num/2)]
    y_outside = lista[(num/2):(num)]

    for _ in 1:(n-(num/2))
        x, y = rand(), rand()
        if x^2 + y^2 <= 1.0
            inside += 1
            push!(x_inside, x)
            push!(y_inside, y)
        else
            push!(x_outside, x)
            push!(y_outside, y)
        end
    end
    pi_estimate = 4 * inside / n
    #print(x_inside)
    #print()
    lista=[x_inside;x_outside;y_inside;y_outside]
    #print(size(lista))
    return pi_estimate, x_inside, y_inside, x_outside, y_outside
end

