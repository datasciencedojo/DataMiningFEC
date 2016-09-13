# Data Science Dojo to extract first names
# Map 1-based optional input ports to variables
pol <- maml.mapInputPort(1) # class: data.frame

require(stringr)

# Cleaning. Replaces double commas with single commas.
pol$name <- str_replace_all(pol$name,",,",",")
pol$name <- str_replace_all(pol$name,", ,",",")
# Cleaning. Replaces double spaces with single spaces.
pol$name <- str_replace_all(pol$name,"  "," ")

# Extracts first names and titles
extract_name_or_title <- function(fullname){
    first_name_chunk <- strsplit(fullname, split=", ")[[1]][2]
    first_name_split <- strsplit(first_name_chunk, split=" ")[[1]]

    first_name_or_title <- ''

    if("MR." %in% first_name_split){
        first_name_or_title <- "MR."
    } else if ("MRS." %in% first_name_split){
        first_name_or_title <- "MRS."
    } else if ("MS." %in% first_name_split) {
        first_name_or_title <- "MS."
    } else if (!is.na(first_name_split)) {
        longest_char_length <- 0
        max_char_index <- 1
    for(j in 1:length(first_name_split)){
        char_length <- nchar(first_name_split[j])
        if( char_length > longest_char_length ){
            longest_char_length <- char_length
            max_char_index <- j
        }
    }

    first_name_or_title <- first_name_split[max_char_index]
    } else {
    first_name_or_title <- NA
    }
    return(first_name_or_title)
}
first_name_chunk <- as.vector(sapply(pol$name, extract_name_or_title))

# Cleaning. Removes symbols from first names
first_name <- str_replace_all(first_name_chunk,"[[:punct:]]","")

# adds a first name column
pol$first_name <- first_name
# filters out nulls, these are indian reservations
#   that somehow got misclassified as individuals
pol <- pol[!pol$first_name=="",]

pol <- pol[,-c(1)]  # Drops original first name columns

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("pol");