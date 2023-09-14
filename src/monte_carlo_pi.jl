using DrWatson
@quickactivate
using Random



"""
    function monte_carlo_pi(n)
Function that returns an approximation of pi.
pi_estimate will be defined using the Monte Carlo method, which
utilizes random point generation to estimate the value of pi

# Arguments
* n=number of interaction

# Example
* n=1_000
* pi_estimate=3.196
"""
function monte_carlo_pi(n)
    inside = 0
    x_inside = Float64[]
    y_inside = Float64[]
    x_outside = Float64[]
    y_outside = Float64[]

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
    #print(inside)
    pi_estimate = 4 * inside / n
    lista=[x_inside;x_outside;y_inside;y_outside]
    #println(lista)
    #print(size(lista))
    return pi_estimate, x_inside, y_inside, x_outside, y_outside,lista
end
