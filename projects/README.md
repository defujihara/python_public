### The Project is structured in following folders:
- project_dbt_etl : it's basically the ingestion using seed and some basic etl functions like fact tables and dim tables. I still kept as lowest granularity for better data exploration.
- project_tableau_viz : visualization layer adding some insights about the data seed.

### Using the starter project_dbt_etl
1- replicate the git repo and in the project_dbt_etl folder
- the project contains a snowflake connection so, it might be required to set the project.yml by your own
2- Try running the following commands:
- dbt debug
- dbt dps 
- dtp compile
- dbt run
- dbt test
note: added a dbt utils for basic test 

3- Use the webclient or another database client like dbeaver to connect to snowflake

### Using the starter project_tableau_viz
4- In project_tableau_viz folder contains the Tableau workbook used to provide the analysis. However if needed i published in tableau public https://public.tableau.com/app/profile/david.fujihara/viz/DataChallengeOverallAnalysis/Analysis?publish=yes

