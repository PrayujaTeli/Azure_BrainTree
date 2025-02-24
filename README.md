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
   - Created tables and inserted data using sql server query into **Azure Data Studio**.  
   - Data can also be imported using the **Azure Import Wizard** for bulk uploads.  
   - If using **Docker**, ensured that files were copied from the local machine into the container before importing them into SQL Server. The following command was used to copy files into the container:  
     ```bash
     docker cp local_file.csv container_name:\
     ```
   - Once copied, data could be imported into SQL Server from within the container.  

## **Key Learnings**  
- Efficient use of **window functions** for ranking within partitions.  
- Handling **NULL values** and **data filtering** for accurate results.  
- Structuring queries for **readability and scalability**.
  
<img width="1050" alt="Screenshot 2025-02-24 at 2 24 57 PM" src="https://github.com/user-attachments/assets/e76cbd35-69a8-4cc6-bf84-dcb82f00f1ad" />

