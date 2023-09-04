using Pkg
Pkg.add("Plots")
using Random

function monte_carlo_pi(n)
    inside = 0
    x_inside = []
    y_inside = []
    x_outside = []
    y_outside = []

    for _ in 1:n
        x, y = rand(), rand()
        if sqrt(x^2 + y^2) <= 1.0
            inside += 1
            push!(x_inside, x)
            push!(y_inside, y)
        else
            push!(x_outside, x)
            push!(y_outside, y)
        end
    end

    pi_estimate = 4 * inside / n
    return pi_estimate, x_inside, y_inside, x_outside, y_outside
end

n = 100000  # Número de pontos gerados
pi_estimate, x_inside, y_inside, x_outside, y_outside = monte_carlo_pi(n) # defnindo os pontos pela função

println("Estimativa de π: $pi_estimate") #estimativa: nao consegui colocar o while para fazer com a precisão certa 

using Plots

scatter(x_inside, y_inside, label="Dentro da precisão", color="red")
scatter!(x_outside, y_outside, label="Fora da precisão", color="blue")
plot!([0, 1], [0, 1], color="black", label=" Raio do Círculo Unitário")
savefig("monte_carlo_pi_plot.pdf")




