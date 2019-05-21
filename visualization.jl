# using Pkgj
# Pkg.add("Plots")
using Plots
using ArgParse

function create_plot(x, y, file)
  plot(x, y)
  savefig(file)
end

s = ArgParseSettings()
@add_arg_table s begin
  "--gen-all"
    help = "Generate all plots"
    arg_type = Bool
    default = true
  "--gen-events-available"
    help = "Generate events available plots"
    arg_type = Bool
    default = false
  "--gen-events-processed"
    help = "Generate total events processed plots"
    arg_type = Bool
    default = false
  "--gen-event-time-deltas"
    help = "Generate LP event time deltas plots"
    arg_type = Bool
    default = false
  "--modelDirList"
    help = "CSV File with directories to walk"
    arg_type = String
    default = "./allModelDirs.csv"
  "--plotsDir"
    help = "Directory to write output files"
    arg_type = String
    default = "./plotsDir/"
  "--no-legend"
    help = "Turn off the legend in all plots"
    arg_type = Bool
    default = false
end


create_plot(1:10, rand(10), "mytestplot.pdf")



