using DrWatson
@quickactivate
using Random

function monte_carlo_pi(n)
    inside = 0
    x_inside = [] 
    y_inside = []
    x_outside = []
    y_outside = []

    for _ in 1:n
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
    return pi_estimate, x_inside, y_inside, x_outside, y_outside
end

using Random

function estimate_pi_v2(n::Int, x_inside::Vector{Float64}, y_inside::Vector{Float64}, x_outside::Vector{Float64}, y_outside::Vector{Float64})
    
    for i in 1:n
        x, y = rand( ), rand( )
        if x^2 + y^2 <= 1
            push!(x_inside, x)
            push!(y_inside, y)
        else
            push!(x_outside, x)
            push!(y_outside, y)
        end
    end
    
    pi_approx = 4 * length(x_inside) / n
    
    return pi_approx, x_inside, y_inside, x_outside, y_outside
end

pi_approx, x_inside, y_inside, x_outside, y_outside = estimate_pi_v2(1000, Float64[], Float64[], Float64[], Float64[])
# Continua a partir da interação anterior:
pi_approx, x_inside, y_inside, x_outside, y_outside = estimate_pi_v2(1000, x_inside, y_inside, x_outside, y_outside)

