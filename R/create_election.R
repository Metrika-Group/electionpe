#' Create election objects which contains information about presidential, regional or municipality data
#' @param year year  
#' @param type type of election. Three options: \code{pre} or (presidential), regional or \code{reg} and municipality or \code{mu}.
#' @param metadata_r1 metadata from election round 1
#' @param data_r1 data from election round 1
#' @param metatada_r2 metadata from election round 2
#' @param data_r2 data from election round 2
#' @author Omar Benites

create_election <- function(year=NULL, 
                            type=c("pre","re","mu"), 
                            metadata_r1=NULL, 
                            data_r1 = NULL,
                            metadata_r2=NULL, 
                            data_r2 = NULL
                            ){
  
  type <- match.arg(type)
  if(type =="pre"){
    nametype <- "presidential"
  } else if(type == "re"){
    nametype <- "regional"
  } else if (type == "mu"){
    nametype <- "municipality"
  }
  
  #build first hierachy of the election: list of data by year
  if(type =="pre"|| type =="reg"){
    
    #divide in two rounds: fist round and second round
    hyear <- list(
                  metadataR1 = metadata_r1, #election round 1
                  dataR1 = data_r1, #election round 1
                  metadataR2 = metadata_r2,  #election round 2
                  dataR2 = data_r2 #election round 2
                 )
    
  } else {
    hyear <- list(
      metadata = metadata,
      data = data
    )
   
  }
  hyear <- list(hyear)
  names(hyear) <- paste0("y", as.character(year))
  #build a second hierachy of the election: a list by type
  htype <- list(hyear) 
  names(htype) <- nametype
  return(htype)  
}




