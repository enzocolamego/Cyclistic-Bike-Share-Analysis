WITH casual AS (
  SELECT
    start_station_name,
    COUNT(*) AS casual_total,
  FROM
    `analise-coursera-448617.TCC.clean_data_bike`
  WHERE
    start_station_name IS NOT NULL
    AND start_station_name != "nan"
    AND member_casual = "casual"
  GROUP BY
    start_station_name
  ORDER BY
    casual_total DESC
  LIMIT 3
),
member AS (
  SELECT
    start_station_name,
    COUNT(*) AS member_total
  FROM
    `analise-coursera-448617.TCC.clean_data_bike`
  WHERE
    start_station_name IS NOT NULL
    AND start_station_name != "nan"
    AND member_casual = "member"
  GROUP BY
    start_station_name
  ORDER BY
    member_total DESC
  LIMIT 3
)

SELECT 
  'casual' AS member_casual, 
  start_station_name,
  casual_total, 
  NULL AS member_total
FROM 
  casual
UNION ALL
SELECT 
  'member' AS member_casual,
  start_station_name,
  NULL AS casual_total,
  member_total
FROM
  member
