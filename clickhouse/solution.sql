CREATE TABLE IF NOT EXISTS server_logs
(
    timestamp DateTime,
    user_id UInt32,
    endpoint String,
    response_time_ms UInt32,
    status_code UInt16
) ENGINE = MergeTree()
ORDER BY (timestamp, endpoint);

SELECT endpoint, avg(response_time_ms) AS avg_response_time
FROM server_logs
GROUP BY endpoint
ORDER BY avg_response_time DESC
LIMIT 5;

SELECT toStartOfHour(timestamp) AS hour, count() AS request_count
FROM server_logs
GROUP BY hour
ORDER BY hour;

SELECT endpoint, countIf(status_code >= 400) * 100 / count() AS error_percentage
FROM server_logs
GROUP BY endpoint
ORDER BY error_percentage DESC;