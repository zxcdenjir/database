SELECT distinct( "LastName" || ' ' || "FirstName") as "RunnerName", r."CountryCode" 
FROM "User" u 
join "Runner" r on u."Email" = r."Email" 
join "Registration" r2 on r2."RunnerId" = r."RunnerId"
join "RegistrationEvent" re on re."RegistrationId" = r2."RegistrationId"
join "Event" e on e."EventId" = re."EventId" 
join "Marathon" m on m."MarathonId" = e."MarathonId"
where m."YearHeld" = 2015
order by "RunnerName";
