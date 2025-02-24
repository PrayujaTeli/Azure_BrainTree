# **SQL Data Analysis Challenge**  

## **Tools Used**  
- **Azure Data Studio** – For writing and executing SQL queries.  
- **SQL Server** – Database management system for querying and analysis.  
- **Docker** – For setting up and managing the SQL Server environment.  

## **Approach to Problem-Solving**  

1. **Understanding the Problem Statement**  
   - Carefully analyzed the requirements, focusing on **grouping, ranking, and filtering** data effectively.  

2. **Query Design**  
   - Used **SQL aggregation functions** like `AVG()`, `SUM()`, and `COUNT()`.  
   - Leveraged **Common Table Expressions (CTEs)** to structure queries efficiently.  
   - Applied **window functions (`RANK()`, `ROW_NUMBER()`)** for ranking data within partitions.  

3. **Data Setup & Import**  
   - Created tables and inserted data manually using **Azure Data Studio**.  
   - Data can also be imported using the **Azure Import Wizard** for bulk uploads.  
   - If using **Docker**, ensured that files were copied from the local machine into the container before importing them into SQL Server. The following command was used to copy files into the container:  
     ```bash
     docker cp local_file.csv container_name:\
     ```
   - Once copied, data could be imported into SQL Server from within the container.  

4. **Optimization & Validation**  
   - Ensured queries were structured for performance and **handled edge cases**.  
   - Verified results using test cases in **Azure Data Studio**.  

## **Key Learnings**  
- Efficient use of **window functions** for ranking within partitions.  
- Handling **NULL values** and **data filtering** for accurate results.  
- Structuring queries for **readability and scalability**.  
