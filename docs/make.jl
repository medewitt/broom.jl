using Documenter
using broom

makedocs(
    sitename = "broom",
    format = Documenter.HTML(),
    modules = [broom]
)


# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
