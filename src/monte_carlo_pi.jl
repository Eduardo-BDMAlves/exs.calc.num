using Plots

using Plots

function monte_carlo_pi(n)
    inside = 0
    x_inside = Float64[]
    y_inside = Float64[]
    x_outside = Float64[]
    y_outside = Float64[]
    for i in 1:n
        x = rand()
        y = rand()
        if x^2 + y^2 < 1
            inside += 1
            push!(x_inside, x)
            push!(y_inside, y)
        else
            push!(x_outside, x)
            push!(y_outside, y)
        end
    end
    pi_estimate = 4 * inside / n
    scatter(x_inside, y_inside, c=:blue, label="Inside")
    scatter!(x_outside, y_outside, c=:red, label="Outside")
    return pi_estimate
end

n = 1000
ϵ = 1e-5
pi_estimate = monte_carlo_pi(n)
while abs(pi_estimate - π) > ϵ
    n *= 2
    pi_estimate = monte_carlo_pi(n)
end

