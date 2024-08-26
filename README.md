# ELT-for-sales-data

## Architecture
[
![etl (2)](https://github.com/user-attachments/assets/6935f179-ec84-440f-8b4d-81ad1065e37c)
](url)







## Tools
<ul>
    <li>Airbyte for extracting the data from SQL Server and loading it to PostgreSQL</li>
    <li>Cron for scheduling the extraction process.</li>
    <li>Postgres as a data warehouse.</li>
    <li>dbt as a transformation and data modeling tool.</li>
    <li>Tableau for data visualization.</li>
</ul>

## star schema model
![Untitled (1)](https://github.com/user-attachments/assets/3f03517b-8da0-4ee3-9778-7aa31dcfd067)


## dbt DAG
![DAG](https://github.com/user-attachments/assets/cf098443-77fe-4a17-94e2-914dd15d4de6)



### Using the starter project

Try running the following commands:
- dbt test ( to check for data quality)
- dbt run  ( to run and validate the models)

To view the Lineage:
- dbt docs generate
- dbt docs serve


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
- I got the data from this [repo](https://github.com/MiladNooraei/Quera-Superstore?tab=readme-ov-file).
