# sql-database
SQL database - World Happiness 2024

Datasets chosen:
World Happiness Index 2024
https://www.kaggle.com/datasets/jainaru/world-happiness-report-2024-yearly-updated
by Jaina published on kaggle
columns: country - region - happiness index etc

World Country Populations 2014 & 2024:
https://www.worldometers.info/world-population/population-by-country/stext
https://m.worldometers.info/world-population/population-by-country/
Dataset contains information on absolute population counts by country for 2014 & 2024
The data on this webpage is provided by https://www.realtimestatistics.net/ - End Worldometers RTS Counters by Google

average annual wages per country 2010 & 2023:
https://en.wikipedia.org/wiki/List_of_countries_by_average_wagext
Wikipedia, OECD = Organization for Economic Co-operation and Development

Jupyter Notebook: sql-database-happiness.ipynb
Loading the data, cleaning the data, creating new tables: 
world_happiness_report_2024_cleaned.csv, Population_counts.csv, average_wages_2010_2023_cleaned.csv

Hypotheses:
1. Happiness is linked to low population increment in the last decade.
2. Happiness is higher in Europe compared to Africa.
3. Happiness is linked to higher Salaries - CANNOT be answered

Setting up an mySQL database and loading these three tables in:
happiness and population worked, but wages table was dropped.
Creating an Entity-Relationship Model (ER Model)
A one-to-one relationship exists between the two tables, linked by the Country Name field.

Key Data Transformation Challenges & Solutions
Header Name Differences & Alignment:
The country name fields had inconsistent headers across tables (happiness.country name vs. population.Country).
Null Values & Data Integrity:
Missing population values caused issues in growth calculations.
Duplicate Entries:
Some countries appeared multiple times due to regional discrepancies.
Data Consistency & Standardization:
Differences in country naming conventions led to mismatches during joins.
By addressing these challenges, the transformed dataset allowed smooth integration between happiness and population data, enabling effective analysis.

The following SQL queries were executed to derive insights:
Happiness vs. Population Growth:
A view (happiness_increase_population) was created to analyze whether rapid population growth/decrease correlates with higher/lower happiness scores.
Countries with highest population increase show medium happiness.
Countries with highest population decrease show higher happiness.

Regional Happiness Insights:
European and Middle Eastern & African (MEA) happiness trends were separately analyzed using CASE statements to segment countries based on their regional indicators.
Views such as european_happiness and african_happiness(MEA) were created to facilitate further analysis.

Major Obstacle: 
The biggest challenge was to upload the csv data tables into mySQL.
Reasons: insufficient cleaning and formating of data tables
and novelty of the uploading process for us.
As this was the most time consuming step: next time, 
we´ll invest more time in data table cleaning and formating.

Conclusions & Implications:
Our data sets are not particularly well suited for creation of a database
and relevant statistical analysis. 
Nevertheless, we could formulate hypotheses and find answers to them:
1.) happiness is higher when population increase is lower
2.) higher happiness in european compared to african (MEA) contries
Outlook: would be great to include the wage development into the analyses.

Presentation:
https://www.canva.com/design/DAGdaAgLGnE/zbklPF8e6BUVXc-mpsNM3Q/edit
