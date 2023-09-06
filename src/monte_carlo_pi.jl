# using Pkg
# Pkg.add("Plots")
using Random

function monte_carlo_pi(n)
    inside = 0
    x_inside = [] # especificar tipo ex: Float64[]
    y_inside = []
    x_outside = []
    y_outside = []

    for _ in 1:n
        x, y = rand(), rand()
        # if sqrt(x^2 + y^2) <= 1.0 # precisa dessa raiz?
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
    return pi_estimate, x_inside, y_inside, x_outside, y_outside
end

n = 100_000  # Número de pontos gerados
# pi_estimate, x_inside, y_inside, x_outside, y_outside = monte_carlo_pi(n) # defnindo os pontos pela função

# println("Estimativa de π: $pi_estimate") #estimativa: nao consegui colocar o while para fazer com a precisão certa


n_iterations = 100_000
error = zeros(n_iterations)
for i in 1:n_iterations
    pi_estimate, x_inside, y_inside, x_outside, y_outside = monte_carlo_pi(n) # defnindo os pontos pela função

    # println("Estimativa de π: $pi_estimate")
    # println("Erro iteração $i: $(pi_estimate-π)")

    error[i]=abs(pi_estimate-π)/π
end


pi_estimate, x_inside, y_inside, x_outside, y_outside = monte_carlo_pi(n*1000) # defnindo os pontos pela função

using Plots

f=let
    f=scatter(x_inside, y_inside, label="Dentro da precisão", color="red",aspect_ratio=:equal)
    scatter!(x_outside, y_outside, label="Fora da precisão", color="blue")
    # plot!([0, 1], [0, 1], color="black", label=" Raio do Círculo Unitário")
    plot!(x->(sqrt(1.0-x^2)),
        color=:cyan,
        label="Raio do círculo unitário",
        linewidth = 2,
        linestyle = :dot
        )
    plot!(xlims=(0,1))
    f
end
savefig(f,"monte_carlo_pi_plot.pdf")
