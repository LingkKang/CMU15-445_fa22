WITH
    EmpId_and_Reg AS (
        SELECT
            EmployeeId,
            RegionId
        FROM
            EmployeeTerritory
        JOIN
            Territory ON Territory.Id = EmployeeTerritory.TerritoryId
        GROUP BY
            EmployeeId
    ),

    Almost_done AS (
        SELECT
            Id,
            FirstName,
            LastName,
            MAX(BirthDate) AS BD,
            RegionId
        FROM
            Employee
        JOIN
            EmpId_and_Reg ON Employee.Id = EmpId_and_Reg.EmployeeId
        GROUP BY
            RegionId
    )

SELECT
    RegionDescription,
    FirstName,
    LastName,
    BD
FROM
    Almost_done
JOIN
    Region ON Region.Id = Almost_done.RegionId
ORDER BY
    RegionId ASC;
