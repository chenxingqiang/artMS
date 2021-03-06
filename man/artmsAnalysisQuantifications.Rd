% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysisQuantifications.R
\name{artmsAnalysisQuantifications}
\alias{artmsAnalysisQuantifications}
\title{Analysis of the Relative Quantifications}
\usage{
artmsAnalysisQuantifications(
  log2fc_file,
  modelqc_file,
  species,
  output_dir = "analysis_quant",
  outliers = c("keep", "iqr", "std"),
  enrich = TRUE,
  l2fc_thres = 1,
  choosePvalue = c("adjpvalue", "pvalue"),
  isBackground = "nobackground",
  isPtm = "global",
  mnbr = 2,
  isFluomics = FALSE,
  pathogen = "nopathogen",
  plotPvaluesLog2fcDist = TRUE,
  plotAbundanceStats = TRUE,
  plotReproAbundance = TRUE,
  plotCorrConditions = TRUE,
  plotCorrQuant = TRUE,
  plotPCAabundance = TRUE,
  plotFinalDistributions = TRUE,
  plotPropImputation = TRUE,
  plotHeatmapsChanges = TRUE,
  plotTotalQuant = TRUE,
  plotClusteringAnalysis = TRUE,
  data_object = FALSE,
  verbose = TRUE
)
}
\arguments{
\item{log2fc_file}{(char) MSstats results file location}

\item{modelqc_file}{(char) MSstats modelqc file location}

\item{species}{(char) Select one species. Species currently supported for
a full analysis (including enrichment analysis):
\itemize{
\item HUMAN
\item MOUSE
}

To find out species supported only for annotation check
\code{?artmsIsSpeciesSupported()}}

\item{output_dir}{(char) Name for the folder to output the results from the
function. Default is current directory (recommended to provide a new folder
name).}

\item{outliers}{(char) It allows to keep or remove outliers. Options:
\itemize{
\item \code{keep} (default): it keeps outliers 'keep', 'iqr', 'std'
\item \code{iqr} (recommended): remove outliers +/- 6 x Interquartile Range (IQR)
\item \code{std} : 6 x standard deviation
}}

\item{enrich}{(logical) Performed enrichment analysis using GprofileR?
Only available for species HUMAN and MOUSE.
\code{TRUE} (default if "human" or "mouse" are the species) or \code{FALSE}}

\item{l2fc_thres}{(int) log2fc cutoff for enrichment analysis (default,
\code{l2fc_thres = 1.5})}

\item{choosePvalue}{(char) specify whether \code{pvalue} or \code{adjpvalue} should
use for the analysis. The default option is \code{adjpvalue}
(multiple testing correction).
But if the number of biological replicates for a given experiment is
too low (for example n = 2), then \code{choosePvalue = pvalue} is recommended.}

\item{isBackground}{(char) background of gene names for enrichment analysis.
\code{nobackground} (default) will use the total number of genes detected.
Alternatively provided the file path name to the background gene list.}

\item{isPtm}{(char) Is a ptm-site quantification?
\itemize{
\item \code{global} (default),
\item \code{ptmsites} (for site specific analysis),
\item \code{ptmph} (Jeff Johnson script output evidence file)
}}

\item{mnbr}{(int) minimal number of biological replicates for imputation
and filtering. Default: \code{mnbr = 2} (Proteins must be found in one of the
conditions in at least 2 of the biological replicates)}

\item{isFluomics}{(logical) Does this data belong to the FluOMICs project?
\code{TRUE} or \code{FALSE} (default)}

\item{pathogen}{(char) Is there a pathogen in the dataset as well?
if it does not, then use \code{pathogen = nopathogen} (default).
Pathogens available: \code{tb} (Tuberculosis), \code{lpn} (Legionella)}

\item{plotPvaluesLog2fcDist}{(logical) If \code{TRUE} (default) plots pvalues
and log2fc distributions}

\item{plotAbundanceStats}{(logical) If \code{TRUE} (default) plots stats graphs
about abundance values}

\item{plotReproAbundance}{(logical) If \code{TRUE} plots reproducibility
based on normalized abundance values}

\item{plotCorrConditions}{(logical) If \code{TRUE} plots correlation
between the different conditions}

\item{plotCorrQuant}{(logical) if \code{TRUE} plots correlation between the
available quantifications (comparisons)}

\item{plotPCAabundance}{(logical) if \code{TRUE} performs PCA analysis of
conditions using normalized abundance values}

\item{plotFinalDistributions}{(logical) if \code{TRUE} plots distribution of both
log2fc and pvalues}

\item{plotPropImputation}{(logical) if \code{TRUE} plots proportion of overall
imputation}

\item{plotHeatmapsChanges}{(logical) if \code{TRUE} plots heatmaps of quantified
changes (both all and significant only)}

\item{plotTotalQuant}{(logical) if \code{TRUE} plots barplot of total number of
quantifications per comparison}

\item{plotClusteringAnalysis}{(logical) if \code{TRUE} performs clustering
analysis between quantified comparisons (more than 1 comparison required)}

\item{data_object}{(logical) flag to indicate whether the required files
are data objects. Default is FALSE}

\item{verbose}{(logical) \code{TRUE} (default) shows function messages}
}
\value{
(data.frame) summary of quantifications, including annotations,
enrichments, etc
}
\description{
Analysis of relative quantifications, including:
\itemize{
\item Annotations
\item Summary files in different format (xls, txt) and shapes (long, wide)
\item Numerous summary plots
\item Enrichment analysis using Gprofiler
\item PCA of quantifications
\item Clustering analysis
\item Basic imputation of missing values
}
}
\examples{
# Testing that the files cannot be empty
artmsAnalysisQuantifications(log2fc_file = NULL,
                              modelqc_file = NULL,
                              species = NULL,
                              output_dir = NULL)
}
\keyword{analysis,}
\keyword{quantifications}
