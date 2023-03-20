CREATE TABLE median_vaccinations AS
SELECT 
    country, 
    CAST(MEDIAN(daily_vaccinations) AS INT) AS median_daily_vaccinations
FROM country_vaccination_stats
GROUP BY country;

UPDATE country_vaccination_stats cv
SET daily_vaccinations = (
  SELECT median_daily_vaccinations
  FROM median_vaccinations mv
  WHERE mv.country = cv.country
)
WHERE daily_vaccinations = "";

UPDATE country_vaccination_stats
SET daily_vaccinations = 0
WHERE daily_vaccinations = "";