select ("LastName" || ' ' || "FirstName") as "RunnerName",
		"CountryName",
		date_part('year', AGE(current_date, "DateOfBirth")) as "Age",
		"Gender",
		row_number() over (partition by e."EventId" order by "RaceTime") as "Position",
		((re."RaceTime" / 60 / 60)::text || 'ч ' || ((re."RaceTime" / 60 % 60)::text || 'мин ' ||  (re."RaceTime" % 60)::text || 'сек')) AS "RaceTime",
		et."EventTypeName",
		m."MarathonName",
		m."YearHeld",
		e."EventName"
from "Runner" r 
join "Country" c on c."CountryCode" = r."CountryCode" 
join "User" u on u."Email" = r."Email" 
join "Marathon" m on m."CountryCode" = r."CountryCode" 
join "Event" e on e."MarathonId" = m."MarathonId"
join "Registration" r2 on r2."RunnerId" = r."RunnerId" 
join "RegistrationEvent" re on re."RegistrationId" = r2."RegistrationId" 
join "Gender" g on g."GenderId" = r."GenderId"
join "EventType" et on et."EventTypeId" = e."EventTypeId" 
where "RaceTime" is not null and "RaceTime" != 0
order by e."EventId", "Gender", "Position";

select (round(avg("RaceTime") / 60 / 60, 2))::text || 'ч ' || (round(avg("RaceTime") / 60 % 60, 2))::text || 'мин ' ||  (round(avg("RaceTime") % 60, 2))::text || 'сек' AS "AverageRaceTime",
		count("RaceTime") as "AmountOfRunners"
from "RegistrationEvent"
where "RaceTime" is not null and "RaceTime" != 0;