#' @param files a vector of files to be imported. 

get_xdd_df <- function(files){
  bbs_xdd <- data.frame()

  ## loop over all the filenames
for(i in 1:length(files)){
  
  # define  the filename for indexing
  fn <- files[i]
  
  # import the json.txt as a json list
  if(exists("json")) rm(json)
  json <- rjson::fromJSON(file = fn)
  
  # the following line (do.call bind_rows) creates a new row for each entry in json$highlight. this means that there will be redundant records in the json.df. 
    ## the alternative to this is either to cat all the highlights into a single character string, and then convert to a data frame _or_ to remove the highlights completely.
      # alternative #1: keep one row per highlight per record    
      json.df <- do.call("bind_rows", lapply(json, as.data.frame)) # this method creates a single row for each highlight
      #alternative #2: remove highlight entirely
      # json.df <- do.call("bind_rows", lapply(json, as.data.frame)) %>% dplyr::select(-highlight) %>% distinct() # this method creates a single row for each highlight
      #alternative 3: combine all the highlights into a single string. this is cumbersome so i will go ahead and avoid it....

      # append the associated filename into a new column
      json.df$filename <- fn
      # append the associated search phrase into a new column
      ind <- str_remove(fn, paste0(getwd(), "/xdd_json/"))
      ind <- str_remove(ind , ".txt")
      
      json.df$searchterm <- ind
      
      # bind the rows of the previous and the current json df  
      bbs_xdd <- bind_rows(bbs_xdd, json.df) # the returned object
        
      
      } # end loop over files (i loop)

# extract the 4-year date from 
bbs_xdd$coveryear <- str_extract(bbs_xdd$coverDate, '[0-9][0-9][0-9][0-9]') %>% as.integer()

return(bbs_xdd)

} # end function
