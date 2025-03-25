with s1 as(SELECT 
    CustomerKey, 
    INITCAP(Prefix) AS Prefix,
    INITCAP(FirstName) AS FirstName,
    INITCAP(LastName) AS LastName,
    BirthDate,
    MaritalStatus,
    Gender,
    LOWER(EmailAddress) AS EmailAddress,
    AnnualIncome,
    TotalChildren,
    EducationLevel,
    Occupation,
    HomeOwner,
    FileLocation,
    LoadTime
FROM {{ ref("customer_snapshot") }}
where dbt_valid_to is null)

select * from s1 
where CustomerKey IS NOT NULL AND  
    Prefix IS NOT NULL AND  
    FirstName IS NOT NULL AND  
    LastName IS NOT NULL AND  
    BirthDate IS NOT NULL AND  
    MaritalStatus IS NOT NULL AND  
    Gender IS NOT NULL AND  
    EmailAddress IS NOT NULL AND  
    AnnualIncome IS NOT NULL AND  
    TotalChildren IS NOT NULL AND  
    EducationLevel IS NOT NULL AND  
    Occupation IS NOT NULL AND  
    HomeOwner IS NOT NULL
