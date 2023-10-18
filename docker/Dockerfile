FROM ghcr.io/dbt-labs/dbt-snowflake:1.6.6

COPY transform/dw/northwind/ .

COPY docker/run_commands.sh .

ENTRYPOINT ["/bin/bash", "run_commands.sh"]
