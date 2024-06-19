# API Docs
bb_api_docs_urls <- list(
    "school" = "https://developer.sky.blackbaud.com/api#api=school&operation=V1AcademicsSectionsBySection_idAssignmentsGet",
    "gl" = "https://developer.sky.blackbaud.com/api#api=56eb17a0a9db9516c46bff6f&operation=GetAccount",
    "ap" = "https://developer.sky.blackbaud.com/api#api=57a342f1d7dcde1c28a749fe&operation=ListAccountsPayableDepartments"
)


### Functions --------------------

find_sky_api_docs <- function(api = "school") {

    utils::browseURL(bb_api_docs_urls[[api]])

}







