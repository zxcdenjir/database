SELECT "LastName", "FirstName", "Gender", date_part('year', AGE(current_date, "DateOfBirth")) as "Age", "MarathonName", "EventName", "RaceTime" from "Runner"
join "User" on "User"."Email" = "Runner"."Email"
join "Registration" on "Runner"."RunnerId" = "Registration"."RunnerId"
join "Gender" on "Gender"."GenderId" = "Runner"."GenderId"
join "RegistrationEvent" on "Registration"."RegistrationId" = "RegistrationEvent"."RegistrationId"
join "Event" on "Event"."EventId" = "RegistrationEvent"."EventId" 
join "Marathon" on "Marathon"."MarathonId" = "Event"."MarathonId"
where "RaceTime" is not null and "RaceTime" != 0;