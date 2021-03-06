#! /usr/bin/Rscript
require(svUnit)  # Needed if run from R CMD BATCH

pkg <- "delftfews"
require(delftfews)

unlink("report.xml")  # Make sure we generate a new report
mypkgSuite <- svSuiteList(pkg, dirs="../../pkg/inst/unitTest")  # List all our test suites
runTest(mypkgSuite, name = pkg)  # Run them...
## need next version of svUnit to run the following line
## runTest(makeTestListFromExamples(pkg, "../../pkg/man/"))
protocol(Log(), type = "junit", file = "report.xml")  # ... and write report
