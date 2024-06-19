# Base API URLs
bb_url_base_list <- list(
    "gl" = "generalledger/v1/",
    "school" = "school/v1/",
    "treasury" = "treasury/v1/",
    "ap" = "accountspayable/v1/",
    "event" = "event/v1/"
)

# GL URL
bb_url_gl_list <- list(
    "funds" = "funds",
    "account" = "accounts",
    "codes" = "codes",
    "budget" = "budgets",
    "fiscal_year" = "fiscalyears",
    "segments" = "segments",
    "structure" = "structure",
    "journalcodes" = "journalcodes",
    "journalentries" = "journalentries",
    "journalentry_batch" = "journalentrybatches",
    "transaction_distribution" = "transactiondistributions",
    "projects" = "projects",
    "projects_types" = "projects/types",
    "customfields" = "customfields",
    "details" = "details",
    "lines" = "lines",
    "scenarios" = "scenarios",
    "validate" = "validate",
    "summary" = "summary",
    "periodsummary" = "periodsummary",
    "transactioncodes" = "transactioncodes",
    "values" = "values"
)

# School URL
bb_url_school_list <- list(
    "lists" = "lists",
    "advanced" = "advanced",
    "roles" = "roles",
    "academics" = "academics",
    "teachers" = "teachers",
    "users" = "users",
    "extended" = "extended",
    "relationships" = "relationships",
    "events" = "events",
    "categories" = "categories",
    "calendar" = "calendar",
    "schedules" = "schedules",
    "meetings" = "meetings",
    "customfields" = "customfields",
    "gradelevels" = "gradelevels",
    "offeringtypes" = "offeringtypes",
    "levels" = "levels",
    "sessions" = "sessions",
    "terms" = "terms",
    "timezone" = "timezone",
    "years" = "years",
    "sections" = "sections",
    "activities" = "activities",
    "academics" = "academics",
    "schedules" = "schedules",
    "master" = "master",
    "sets" = "sets",
    "courses" = "courses",
    "cycles" = "cycles",
    "departments" = "departments",
    "students" = "students",
    "enrollments" = "enrollments",
    "changes" = "changes",
    "content" = "content"
)

# Events URL
bb_url_events_list <- list(
    "eventcategories" = "eventcategories",
    "eventlist" = "eventlist",
    "events" = "events"

)


# Treasury URL
bb_url_treasury_list <- list(
    "bankaccounts" = "bankaccounts",
    "payments" = "payments"
)

# AP URL
bb_url_ap_list <- list(
    "invoices" = "invoices",
    "vendors" = "vendors",
    "addresses" = "addresses"
)

### Parameters --------------------

bb_par_gl <- list(
    "from_date" = NULL,
    "to_date" = NULL,
    "account_number" = NULL,
    "batch_id" = NULL,
    "ui_batch_id" = NULL,
    "ui_project_id" = NULL,
    "journal" = NULL,
    "type_code" = NULL,
    "last_modified" = NULL,
    "post_status" = NULL,
    "search_text" = NULL,
    "from_account" = NULL,
    "to_account" = NULL,
    "from_account_code" = NULL,
    "to_account_code" = NULL,
    "status" = NULL,
    "scenarioId" = NULL,
    "fiscal_year_id" = NULL,
    "fiscal_period_id" = NULL,
    "ui_project_id" = NULL,
    "transaction_code_1_value" = NULL,
    "transaction_code_2_value" = NULL,
    "transaction_code_3_value" = NULL,
    "transaction_code_4_value" = NULL,
    "encumbrance" = NULL,
    "include_tax_entity" = NULL
)

bb_par_school <- list(
    "user_id" = NULL,
    "roles" = NULL,
    "base_role_ids" = NULL,
    "first_name" = NULL,
    "last_name" = NULL,
    "email" = NULL,
    "maiden_name" = NULL,
    "grad_year" = NULL,
    "start_date" = NULL,
    "end_date" = NULL,
    "end_grad_year" = NULL,
    "offering_types" = NULL,
    "section_ids" = NULL,
    "last_modified" = NULL,
    "show_time_for_current_date" = NULL,
    "school_year" = NULL,
    "level_num" = NULL,
    "level_id" = NULL,
    "department_id" = NULL
)

bb_par_events <- list(
    "include_inactive" = NULL,
    "name" = NULL,
    "lookup_id" = NULL,
    "category" = NULL,
    "event_id" = NULL,
    "start_date_from" = NULL,
    "start_date_to" = NULL,
    "date_added" = NULL,
    "last_modified" = NULL,
    "fields" = NULL,
    "sort" = NULL
)

bb_par_treasury <- list(
    "bank_account_id" = NULL,
    "transaction_type" = NULL,
    "transaction_status" = NULL,
    "post_status" = NULL,
    "from_post_date" = NULL,
    "to_post_date" = NULL,
    "check_type" = NULL,
    "starting_check_number" = NULL,
    "ending_check_number" = NULL,
    "from_transaction_status_date" = NULL,
    "to_transaction_status_date" = NULL
)

bb_par_ap <- list(
    "to_date" = NULL,
    "from_date" = NULL,
    "invoice_status" = NULL,
    "vendor_name" = NULL,
    "status" = NULL,
    "ui_vendor_id" = NULL,
    "customer_number" = NULL,
    "last_modified" = NULL,
    "date_added" = NULL,
    "added_by" = NULL,
    "last_modified_by" = NULL,
    "payment_method" = NULL,
    "post_status" = NULL,
    "search_text" = NULL
)






