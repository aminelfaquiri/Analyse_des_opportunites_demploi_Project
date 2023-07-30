create database Offer_demploi_DB_1

use Offer_demploi_DB_1
--  job opportunities with specific job roles (e.g., data scientist and data engineer):

SELECT *
FROM [job_opportunity]
WHERE [job_role] IN ('data scientist', 'data engineer');

--  job opportunities that offer negotiation for salary: :
SELECT *
FROM [job_opportunity]
WHERE [Negotiation] = 1;

-- job opportunities along with company and location details :
SELECT
    jo.Id AS [Job_Opportunity_Id],
    c.Name AS [Company_Name],
    l.Full_location AS [Location],
    jo.[Job_Type],
    jo.[Experience_level],
    jo.[AVG_Salary],
    jo.[Negotiation],
    jo.[custom_asterisk],
    jo.[job_role]
FROM
    [job_opportunity] jo
INNER JOIN
    [Company] c ON jo.[Company_id] = c.[Id]
INNER JOIN
    [Location] l ON jo.[Location_id] = l.[Id];


-- job opportunities along with associated country names:
SELECT
    jo.[Id] AS [Job_Opportunity_Id],
    c.[Country_name] AS [Country],
    jo.[Job_Type],
    jo.[Experience_level],
    jo.[AVG_Salary],
    jo.[Negotiation],
    jo.[custom_asterisk],
    jo.[job_role]
FROM
    [job_opportunity] jo
INNER JOIN
    [Country] c ON jo.[Country_id] = c.[id];
