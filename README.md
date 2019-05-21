# DESMetrics
Sean Kane
University of Cincinnati

## Adding to the project
Additions to the DESMetrics project should be done by adding functions to the desmetrics directory which contains a Go library. The library functions can then be called in the analysis.go or sampler.go files. The visualizations.jl file will hold visualizations for the output of the analysis tool.

## Packaging
For Go 1.5 and above the vendoring feature allows the importing of local
packages. Thus, the package for desmetrics is placed in a folder called
`desmetrics/vendor` and can be imported as `import "desmetrics"`

## TODO

* [I] Analysis

* [I] Sampling

* [I] Visualizations
  * [I] Events Available By Simulation Cycle Sorted Normalized
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] Events Processed By an LP
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] Normalized Average Timestamp Delta
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] relativeReceiveTimeDeltaMeans
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] relativeReceiveTimeStdDev
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] coefficientOfVariationOfReceiveTimeDeltasMean
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] timesAnEventHadSameReceiveTime
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter
  * [I] relativeTimeIntervalToExecute100Events
    * [I] Linear Scatter [I] Line Scatter [I] Log Scatter [I] Log Scatter