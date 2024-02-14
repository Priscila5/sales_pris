
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          `zone` AS `markets.zone`,
          COUNT(*) AS `markets.count`
      FROM
          `sales`.`markets` AS `markets`
      WHERE `zone` <> ''
      GROUP BY
          1
      ORDER BY
          `zone` DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: markets_zone {
    type: string
    sql: ${TABLE}.`markets.zone` ;;
  }

  dimension: markets_count {
    type: number
    sql: ${TABLE}.`markets.count` ;;
  }

  set: detail {
    fields: [
        markets_zone,
	markets_count
    ]
  }
}
