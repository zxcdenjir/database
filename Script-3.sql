select ("LastName" || ' ' || "FirstName") as "RunnerName", "MarathonName", "EventName", row_number() over (partition by e."EventId" order by "RaceTime") as "Position", 
((re."RaceTime" / 60 / 60)::text || 'ч ' || ((re."RaceTime" / 60 % 60)::text || 'мин ' ||  (re."RaceTime" % 60)::text || 'сек')) AS "RaceTime", "Gender", date_part('year', AGE(current_date, "DateOfBirth")) as "Age" from "Marathon" m 
join "Event" e on m."MarathonId" = e."MarathonId"
join "RegistrationEvent" re on re."EventId" = e."EventId"
join "Registration" r on r."RegistrationId" = re."RegistrationId" 
join "Runner" run on run."RunnerId" = re."RegistrationId" 
join "Gender" g on g."GenderId" = run."GenderId" 
join "User" u on u."Email" = run."Email" 
where "RaceTime" is not null and "RaceTime" != 0
order by e."EventId", "Gender", "Position";