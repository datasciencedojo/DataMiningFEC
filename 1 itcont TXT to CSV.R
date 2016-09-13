# FEC source:
# http://www.fec.gov/finance/disclosure/ftpdet.shtml#a2015_2016
# dataset:
# ftp://ftp.fec.gov/FEC/2016/indiv16.zip

############################
# Global Input Field Input #
############################

# root folder
io.base_dir <- "C:/<users>/<my working directory>"
i.filename <- "itcont.txt"
i.filepath <- paste(io.base_dir, i.filename, sep="")

###############################################
# Read in individual contributions list       #
###############################################

# Sample from the individual contribution dataset
#   The dataset is 1.7GB so sampling is necessary
#   for now.
# Set to -1 for 100% of the data
sample_amount = -1
pol <- read.table(
        file=i.filepath,  # file to read in
        sep="|",  # pipe deliminated file
        quote="",  # parses in single quotes and escape slashes as text
        comment.char="",  # parse in pound symbol as text
        stringsAsFactors=FALSE,  # do not convert to factors
        nrow=sample_amount  # rows to read in
    )

# headers and information:
# http://www.fec.gov/finance/disclosure/metadata/DataDictionaryContributionsbyIndividuals.shtml
pol.headers <- c(
    "CMTE_ID",
    "AMNDT_IND",
    "RPT_TP",
    "TRANSACTION_PGI",
    "IMAGE_NUM",
    "TRANSACTION_TP",
    "ENTITY_TP",
    "NAME",
    "CITY",
    "STATE",
    "ZIP_CODE",
    "EMPLOYER",
    "OCCUPATION",
    "TRANSACTION_DT",
    "TRANSACTION_AMT",
    "OTHER_ID",
    "TRAN_ID",
    "FILE_NUM",
    "MEMO_CD",
    "MEMO_TEXT",
    "SUB_ID"
)
pol.headers <- tolower(pol.headers)  # Formats headers
colnames(pol) <- pol.headers  # Assigns headers

############################
# Output File as CSV       #
############################
o.filename <- "individual contributions.csv"
o.filepath <- paste(io.base_dir, o.filename, sep="")
write.csv(pol, file=o.filepath, row.names=FALSE, quote=TRUE)