connection: "sales_dummy"

include: "/views/**/*.view.lkml"


datagroup: sales_pris_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sales_pris_default_datagroup


explore: products {}
explore: help_category {}
explore: markets {}
explore: date {}


explore: transactions {
  join: products {
  relationship: many_to_many

  sql_on: ${transactions.product_code}=${products.product_code};;
  }

}
explore: customers {
  join: transactions {
  relationship: many_to_many

    sql_on: ${customers.customer_code}=${transactions.customer_code};;
  }

}
explore: pml {}

explore: nuevo {

  view_name: customers
}
