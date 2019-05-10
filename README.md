# DESMetrics
Sean Kane
University of Cincinnati

## Adding to the project
Additions to the DESMetrics project should be done by adding functions to the desmetrics directory which contains a Go library. The library functions can then be called in the analysis.go or sampler.go files. The visualizations.jl file will hold visualizations for the output of the analysis tool.

## Packaging
For Go 1.5 and above the vendoring feature allows the importing of local
packages. Thus, the package for desmetrics is placed in a folder called
`desmetrics/vendor` and can be imported as `import "desmetrics"`