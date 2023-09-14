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
    lista=Array[x_inside;x_outside;y_inside;y_outside]
    #println(lista)
    #print(size(lista))
    return pi_estimate, x_inside, y_inside, x_outside, y_outside,lista
end


