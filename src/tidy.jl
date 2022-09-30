"""
    tidy(mod::GeneralizedLinearMixedModel, model_name = missing, exponentiate = missing)

Extract model coefficients from a generalized linear mixed model from MixedModels.jl

"""
function tidy(mod::GeneralizedLinearMixedModel, model_name = missing, exponentiate = missing)
    use_table = coeftable(mod)
    colz = clean_col_names(use_table.colnms)
    out = DataFrame(parameter = use_table.rownms)

    if !ismissing(model_name)
        out.model_name .= model_name
    
    end

    for i in eachindex(colz)
        nm_use = colz[i]
        colnm = "$nm_use"
        out[!,colnm] = use_table.cols[i]
    end

    if !ismissing(exponentiate)
        out[ !, :OR] = exp.(out.coef)
        out[ !, :OR_lo] = exp.(out.coef .+ (-1.96) .* out.stderror)
        out[ !, :OR_hi] = exp.(out.coef .+ 1.96 .* out.stderror)
    end

    return out
end

function tidy(mod::StatsModels.TableRegressionModel, model_name = missing, exponentiate = missing)
    use_table = coeftable(mod)
    colz = clean_col_names(use_table.colnms)
    out = DataFrame(parameter = use_table.rownms)

    if !ismissing(model_name)
        out.model_name .= model_name
    
    end

    for i in eachindex(colz)
        nm_use = colz[i]
        colnm = "$nm_use"
        out[!,colnm] = use_table.cols[i]
    end

    if !ismissing(exponentiate)
        out[ !, :OR] = exp.(out.coef)
        out[ !, :OR_lo] = exp.(out.coef .+ (-1.96) .* out.stderror)
        out[ !, :OR_hi] = exp.(out.coef .+ 1.96 .* out.stderror)
    end

    return out
end