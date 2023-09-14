using DrWatson
@quickactivate
include(srcdir("monte_carlo_pi.jl"))
using Random
using LinearAlgebra
n=100_000
pi_estimate, x_inside, y_inside, x_outside, y_outside, lista=monte_carlo_pi(n)
#println(lista)
#num=length(lista)
#x1=num ÷ 4
#println(lista[1:x1])

out_dict = Dict(
    "pi_estimate" => pi_estimate,
    "x_inside" => x_inside,
    "y_inside" => y_inside,
    "x_outside" => x_outside,
    "y_outside" => y_outside,
    )

monte_carlo_pi_otimiz(n,out_dict)

function monte_carlo_pi_otimiz(n,out_dict)
    x_inside = out_dict["x_inside"]
    # y_inside = out_dict["y_inside"]
     x_outside = out_dict["x_outside"]
    # y_outside = out_dict["y_outside"]
    inside=length(x_inside)
    outside=length(x_outside)
    num=inside+outside
    #println(inside)
    for _ in 1:n
        x, y = rand(), rand()
        if x^2 + y^2 <= 1.0
            inside += 1
            push!(out_dict["x_inside"], x)
            push!(out_dict["y_inside"], y)
        else
            push!(out_dict["x_outside"], x)
            push!(out_dict["y_outside"], y)
        end
    end
    #print(inside)
    pi_estimate = 4 * inside / (n+num)
    #print(x_inside)
    #print()
    #print(size(lista))
    return pi_estimate
end
