"""
A doubly stochastic chain sampler that uses wrapped guassian distributions on both directions in 2D 
with a fixed variance. 
"""
function wrapped_gaussian_sampler_2d(
    state::Vector{T},
    lower_left::Tuple{Real, Real}, 
    upper_right::Tuple{Real, Real};
    sigma::Real=1
) where {T<:Real}
    lower = [lower_left[1], lower_left[2]]
    upper = [upper_right[1], upper_right[2]]
    function loop_back(x, l, u)  # assert periodic conditions on the rectangle. 
        return mod(x, u - l) + l
    end
    N = Normal(0, sigma)
    return loop_back.(state + rand(N, 2), lower, upper)
end
