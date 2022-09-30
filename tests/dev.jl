using DataFrames
using CSV
using GLM
using broom
dat = CSV.File("data/xy.csv") |> DataFrame

o = lm(@formula(y ~ x), dat)

tidy(o)
