select "CharityName", sum("SponsorshipTarget"), count("SponsorName")
from "Registration" r 
join "Sponsorship" s on s."RegistrationId" = r."RegistrationId"
join "Charity" c on c."CharityId" = r."CharityId"
group by "CharityName";
