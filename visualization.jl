
# using Plots
using ArgParse
using CSV
using JSON

# function create_plot(x, y, file)
#   plot(x, y)
#   savefig(file)
# end

function parse_command_line()
  s = ArgParseSettings()

  @add_arg_table s begin
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
    "--skip-scatter-plots"
      help = "Do not generate scatter plots (saving time)"
      arg_type = Bool
      default = true
    "--no-plot-title"
      help = "Do not generate plot titles"
      arg_type = Bool
      default = false
  end

  return parse_args(s)
end

function events_available(modelDirs, modelTotals)

end

function total_events_processed(modelDirs, modelTotals)

end

function event_time_deltas(modelDirs, modelTotals)
  plotTitle = ""
  xAxisLabel = ""
  yAxisLabel = ""
  colors = ""

  modelNames = []
  modelData = []
  numModels = 0
  normalizedTimeDeltaMeans = []
  stdDevOfReceiveTimeDeltaMeans = []
  coefficientOfVarriationOfReceiveTimeDeltaMeans = []
  timesAnLPEventHadSameReceiveTime = []
  normalizedTimeIntervalToExecute100Events = []
  coeffOfVariationOfSamples = []

  println("Plotting Event Time Deltas Data")
  global plotsDir

  for i in 1:size(modelDirs, 1)
    println(modelDirs[i])

    outDir = plotsDir * modelDirs[i][1]

    if !isdir(outDir)
      mkpath(outDir)
    end

    rawData = CSV.File(modelDirs[i][1] * "/analysisData/eventReceiveTimeDeltasByLP.csv"; comment="#", limit=19)
    println(modelData)
    # modelNames[i] = 


  end
end

# create_plot(1:10, rand(10), "mytestplot.pdf")

function main() 
  parsed_args = parse_command_line()
  # println("Parsed args: ")

  # for (arg, val) in parsed_args
  #   println("  $arg => $val")
  # end

  global plotsDir = parsed_args["plotsDir"]

  # Load all the directories from the model directories CSV
  all_models = CSV.read(parsed_args["modelDirList"]; delim=",", comment="#")
  modelTotalsByName = Dict()

  for i in 1:size(all_models, 1)#model in all_models

    open(all_models[i][1] * "modelSummary.json", "r") do f
      dicttxt = read(f, String)
      dict = Dict()
      dict=JSON.parse(dicttxt)
      modelTotalsByName[all_models[i][1]] = [dict["total_lps"], dict["event_data"]["total_events"]]
    end

  end

  println(modelTotalsByName)

  if parsed_args["gen-all"] || parsed_args["gen-events-available"]
    events_available(all_models, modelTotalsByName)
  end

  if parsed_args["gen-all"] || parsed_args["gen-events-processed"]
    total_events_processed(all_models, modelTotalsByName)
  end

  if parsed_args["gen-all"] || parsed_args["gen-event-time-deltas"] 
    event_time_deltas(all_models, modelTotalsByName)    
  end



end

main()