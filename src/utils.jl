"""
    clean_col_names

clean_col_names

"""
function clean_col_names(cols)
    
    colz = replace.(cols, "." =>  "")
    colz = replace.(colz, " " =>  "")
    colz = replace.(colz, "%" =>  "")
    colz = lowercase.(colz)
    colz = replace.(colz, "pr(>|t|)"=> "pvalue")

    return colz

end

