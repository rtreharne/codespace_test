args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 1) {
  stop("Usage: Rscript stage_1.R <dataset_path>")
}

dataset_path <- args[1]
data <- read.csv(dataset_path, stringsAsFactors = FALSE)

signals <- data[data$keep == 1, ]
signals <- signals[order(signals$pos), ]

digits <- c()
for (i in 1:nrow(signals)) {
  encoded <- as.integer(signals$encoded[i])
  key <- as.integer(signals$key[i])
  pos <- as.integer(signals$pos[i])
  digit <- (encoded - key - (pos * 3)) %% 10
  digits <- c(digits, as.character(digit))
}

cat(paste(digits, collapse = ""))