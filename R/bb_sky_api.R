### API Details --------------------

bb_ap_id <- Sys.getenv("bb_ap_id")
bb_ap_secret <- Sys.getenv("bb_ap_secret")
bb_auth_url <- "https://app.blackbaud.com/oauth/authorize"
bb_token_url <- "https://oauth2.sky.blackbaud.com/token"
bb_redirect <- "http://localhost:1410/"
bb_sub_key <- Sys.getenv("bb_sub_key")

### URLS --------------------

# Base URL
bb_url_base <- "https://api.sky.blackbaud.com/"

### API App --------------------

bb_client <- httr2::oauth_client(
    id = bb_ap_id,
    token_url = bb_token_url,
    secret = bb_ap_secret,
    name = "R Dashboard",
    auth = "header"
)




### Main Function --------------------

bb_get_func <- function(
        api_url = NULL,
        url1 = NULL,
        url2 = NULL,
        url3 = NULL,
        url4 = NULL,
        url5 = NULL,
        limit = 500,
        offset = 0,
        page = 1,
        marker = 0,
        params = NULL,
        testing = F,
        no_format = F,
        no_page = F,
        method = "GET",
        body = NULL,
        ...
) {

    # Setup Variables

    params <- params

    params2 <- list(...)

    count = 1

    times = 0

    offset = offset

    page = page

    page_helper = 1

    marker = marker

    tib_list <- list()

    while ((offset < count) & page_helper != 0 & marker != "") {

        #Base Function that makes the API Call

        #httr2::oauth_cache_path()

        base_data <-
            httr2::request(base_url = bb_url_base) |>
            httr2::req_oauth_auth_code(
                client = bb_client,
                auth_url = bb_auth_url,
                redirect_uri = bb_redirect,
                cache_disk = T,
                cache_key = "abc"
            ) |>
            httr2::req_throttle(rate = 58/60) |>
            httr2::req_retry(
                max_tries = 5,
                is_transient = ~ httr2::resp_status(.x) %in% c(429, 500, 503),
                backoff = ~5
            ) |>
            httr2::req_url_path(api_url) |>
            httr2::req_url_path_append(url1) |>
            httr2::req_url_path_append(url2) |>
            httr2::req_url_path_append(url3) |>
            httr2::req_url_path_append(url4) |>
            httr2::req_url_path_append(url5) |>
            httr2::req_url_query(
                limit = limit,
                offset = offset
            ) |>
            httr2::req_url_query(page = page) |>
            httr2::req_url_query(marker = marker) |>
            httr2::req_url_query(!!!params, .multi = "comma") |>
            httr2::req_url_query(!!!params2, .multi = "comma") |>
            httr2::req_headers(
                "Bb-Api-Subscription-Key" = bb_sub_key
            ) |>
            httr2::req_method(method)

        # Print for Testing Purposes

        if (testing) {

            print(base_data)

        }

        if (!is.null(body)) {

            base_data <-
                base_data |>
                httr2::req_progress(type = "up") |>
                httr2::req_body_json(data = body) |>
                httr2::req_perform()

            return(base_data)

        }

        base_data <- base_data |> httr2::req_perform()

        #Loop

        base_data <- base_data |>
            httr2::resp_body_json(simplifyVector = F)

        times <- times + 1

        # Paging Types
        # Offset
        # Next
        # Page

        if (no_page) {

            return(base_data)

        } else {

            if (names(base_data)[1] == "count" & names(base_data)[2] == "value") {
                page_type <- "offset"
            } else if (names(base_data)[1] == "count" &
                       names(base_data)[2] == "page" &
                       names(base_data)[3] == "results") {
                page_type <- "page"
            } else if (names(base_data)[1] == "count" &
                       names(base_data)[2] == "next_link" &
                       names(base_data)[3] == "value") {
                page_type <- "next"
            }

            else {
                page_type <- "none"
            }

            if (page_type == "offset") {

                count <- base_data$count

                tib_list[[times]] <- base_data

                offset <- length(base_data$value) + offset

            } else if (page_type == "page") {

                page <- page + 1

                count <- base_data$count

                tib_list[[times]] <- base_data

                page_helper <- (page * count)

            } else if (page_type == "next") {

                count <- base_data$count

                marker <- ifelse(
                    base_data$next_link == "",
                    "",
                    stringr::str_remove(base_data$next_link, ".*marker=")
                )

                tib_list[[times]] <- base_data

            } else {

                count <- offset

                tib_list[[times]] <- base_data |>
                    purrr::modify_tree(leaf = ~(.x %||% NA)) |>
                    purrr::modify_if(.p = \(x) is.list(x) & length(x) != 1, .f = list)
            }

            #count

            #tib_list

            #offset

        }
    }

    data <- dplyr::bind_rows(tib_list)

    if (no_format) {

        return(data)

    } else {

        if (page_type == "offset" | page_type == "next") {

            data <- data |> tidyr::unnest_wider(value)

        } else if (page_type == "page") {

            data <- data |> tidyr::unnest_wider(results)

        } else {

            data

        }

        return(data)

    }

}
