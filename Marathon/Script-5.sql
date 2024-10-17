select ("LastName" || ' ' || "FirstName") as "RunnerName", r."Email", rs."RegistrationStatus", m."MarathonName", e."EventName", et."EventTypeName"
from "Runner" r 
join "User" u on u."Email" = r."Email" 
join "Marathon" m on m."CountryCode" = r."CountryCode" 
join "Event" e on e."MarathonId" = m."MarathonId"
join "Registration" r2 on r2."RunnerId" = r."RunnerId" 
join "RegistrationEvent" re on re."RegistrationId" = r2."RegistrationId" 
join "EventType" et on et."EventTypeId" = e."EventTypeId" 
join "RegistrationStatus" rs on r2."RegistrationStatusId" = rs."RegistrationStatusId" 
where "RaceTime" is not null and "RaceTime" != 0 and m."YearHeld" = 2015
order by rs."RegistrationStatusId", et."EventTypeId", e."EventId", "RunnerName";

select count("RaceTime") as "AmountOfRunners"
from "Runner" r 
join "User" u on u."Email" = r."Email" 
join "Marathon" m on m."CountryCode" = r."CountryCode" 
join "Event" e on e."MarathonId" = m."MarathonId"
join "Registration" r2 on r2."RunnerId" = r."RunnerId" 
join "RegistrationEvent" re on re."RegistrationId" = r2."RegistrationId" 
join "EventType" et on et."EventTypeId" = e."EventTypeId" 
where "RaceTime" is not null and "RaceTime" != 0 and m."YearHeld" = 2015;
