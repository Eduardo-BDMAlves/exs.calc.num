using DrWatson
@quickactivate
include(srcdir("monte_carlo_pi.jl"))
include(srcdir("MonteCarloOtimi.jl"))
n=2000_000
pi_estimate, x_inside, y_inside, x_outside, y_outside, lista=monte_carlo_pi(n)
out_dict = Dict(
    "pi_estimate" => pi_estimate,
    "x_inside" => x_inside,
    "y_inside" => y_inside,
    "x_outside" => x_outside,
    "y_outside" => y_outside,
    )
n=5_000_000
pi_estimate=monte_carlo_pi_otimiz(n,out_dict)
