# ETL Project with Airbyte, Snowflake, dbt, and Preset

## Introduction

This project demonstrates an ETL (Extract, Transform, Load) pipeline that takes data from a hosted RDS Postgres instance (using Airbyte), transforms the data in Snowflake, creates models with dbt, and serves the models in Preset. This README provides an overview of the project, setup instructions, and usage guidelines.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before using this ETL pipeline, ensure you have the following prerequisites:

- An active Snowflake account.
- Airbyte installed and configured.
- Python and dbt installed.
- Preset set up for serving models.

## Setup

1. **Setting up Snowflake**:
   - Create a Snowflake database and configure your connection details. Make note of your Snowflake account URL, username, and password.

2. **Setting up Airbyte**:
   - Install Airbyte and configure connections for both the source (RDS Postgres) and destination (Snowflake). Use the Snowflake connection details you prepared earlier.

3. **dbt Configuration**:
   - Install dbt and configure the project to connect to your Snowflake database.
   - Create a `dbt_project.yml` file to define your project configuration.

4. **Preset Setup**:
   - Set up Preset to serve your dbt models. Configure Preset to connect to your Snowflake database.

## Usage

1. **Ingest Data with Airbyte**:
   - Run Airbyte to ingest data from the RDS Postgres instance into Snowflake.

2. **Transform Data with dbt**:
   - Use dbt to transform the data and create models in Snowflake.

3. **Serve Models with Preset**:
   - Start Preset to serve your dbt models and create dashboards.

## Folder Structure

- `/airbyte` - Configuration files for Airbyte.
- `/dbt` - Contains the dbt project files, including models, transformations, and SQL scripts.
- `/preset` - Configuration files for Preset.
- `/scripts` - Useful scripts and utilities for the ETL process.

## Contributing

If you want to contribute to this project or report issues, please follow our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute it as per the terms of the license.

---

Feel free to modify and expand upon this README to suit the specific details of your project. Remember to provide clear instructions and explanations for potential collaborators and users.
