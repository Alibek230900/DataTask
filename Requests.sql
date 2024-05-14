I

3.1.2
SELECT
  COUNT(DISTINCT searcher_uid) AS DAU,
  COUNTIF(event_name IN ('opened_chat', 'viewed_phone_num')) AS Contacts
FROM
  `kaspi-mobile.T_KASPI_TEST_DATA.t_kaspi_test_data`
WHERE
  DATE(event_ts) = '2023-08-14';


3.1.3


SELECT
  COUNT(*) AS Cross_City_Contacts,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `kaspi-mobile.T_KASPI_TEST_DATA.t_kaspi_test_data` WHERE EXTRACT(MONTH FROM event_ts) = 8), 2) AS Cross_City_Contacts_Ratio
FROM
  `kaspi-mobile.T_KASPI_TEST_DATA.t_kaspi_test_data`
WHERE
  EXTRACT(MONTH FROM event_ts) = 8
  AND event_name IN ('opened_chat', 'viewed_phone_num')
  AND user_city != advert_city;




3.1.5

SELECT
  category,
  COUNT(*) AS Category_Search_Count
FROM
  `kaspi-mobile.T_KASPI_TEST_DATA.t_kaspi_test_data`
WHERE
  EXTRACT(MONTH FROM event_ts) = 8
  AND event_name = 'text_query_searched'
GROUP BY
  category
ORDER BY
  Category_Search_Count DESC
LIMIT 1;
