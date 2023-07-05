module EconDatasets

using TestItems
using CSV: CSV
using DataDeps: @datadep_str


module Shiller
    include("shiller.jl")

    export shiller_annual
end

@testitem "Shiller" begin
    using EconDatasets.Shiller
    using DataFrames
    
    df = shiller_annual()
    @test size(df) == (149, 13)
    @test extrema(df.year) == (1871, 2019)
    @test colmetadata(df, :CPI)["label"] == "Consumer Price Index"
    @test names(df) == ["year", "P", "D", "E", "R", "RLONG", "CPI", "RealR", "hpi", "rhpi", "rbuildingcosts", "population", "r"]
end

end