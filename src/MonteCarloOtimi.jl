using DrWatson
@quickactivate
using Random
using LinearAlgebra
"""
    function monte_carlo_pi_otimiz(n,out_dict)
This function is an optimization of the Monte Carlo method for discovering the value of pi
it leverages the interactions already performed by the initial code to make its own,
making it faster and more accurate.

# Arguments

* n::trype(Float64)= number of interaction 

* out_dict::Dict{String,Any}= Information about the last interaction

# Example

* n=2_000_000

* pi_estimate=3.14151

* out_dict="x_inside"    => [0.291867, 0.376147, 0.135833, 0.122705, 0.327279, 0.402654, 0.300471, 0.457514, 0.41373, 0.751217  …  0.594236, 0.893376, 0.900658, 0.0837758, 0.143211, 0.931889, 0.818813, 0.354467, 0.271801, 0.254442]   
"y_inside"    => [0.951827, 0.295716, 0.805783, 0.15332, 0.000134622, 0.216048, 0.322821, 0.394098, 0.408853, 0.655627  …  0.1101, 0.287226, 0.298592, 0.122436, 0.281582, 0.299728, 0.231894, 0.236337, 0.395659, 0.816355]   
"y_outside"   => [0.600137, 0.961076, 0.744189, 0.415661, 0.502269, 0.520277, 0.941339, 0.89699, 0.979658, 0.521893  …  0.749031, 0.627524, 0.342228, 0.808384, 0.837012, 0.339638, 0.928493, 0.633243, 0.881754, 0.53228]     
"x_outside"   => [0.959647, 0.433092, 0.956274, 0.987321, 0.926091, 0.998703, 0.474743, 0.788085, 0.235986, 0.868997  …  0.973301, 0.880696, 0.963271, 0.814603, 0.913338, 0.957289, 0.682288, 0.93355, 0.89342, 0.904404]     
"pi_estimate" => 3.14151

* n=5_000_000

* pi_estimate=3.142309142857143
"""       
function monte_carlo_pi_otimiz(n,out_dict)
    x_inside = out_dict["x_inside"]
    # y_inside = out_dict["y_inside"]
     x_outside = out_dict["x_outside"]
    # y_outside = out_dict["y_outside"]
    inside=length(x_inside)
    outside=length(x_outside)
    num= inside+ outside
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
    pi_estimate = 4 * inside / (n+num)
    return pi_estimate
end
