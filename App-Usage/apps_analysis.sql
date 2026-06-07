SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE IF NOT EXISTS app_time;
USE app_time;

DROP TABLE IF EXISTS raw_app_usage;
CREATE TABLE raw_app_usage SELECT * FROM app_used_time;

DROP TABLE IF EXISTS clean_app_usage;
CREATE TABLE clean_app_usage SELECT DISTINCT * FROM raw_app_usage;

UPDATE clean_app_usage SET
Amazon_time_occupation=IFNULL(Amazon_time_occupation,0),
AmazonVideo_time_occupation=IFNULL(AmazonVideo_time_occupation,0),
Apple_time_occupation=IFNULL(Apple_time_occupation,0),
AppleiCloud_time_occupation=IFNULL(AppleiCloud_time_occupation,0),
AppleiTunes_time_occupation=IFNULL(AppleiTunes_time_occupation,0),
AppleStore_time_occupation=IFNULL(AppleStore_time_occupation,0),
DataSaver_time_occupation=IFNULL(DataSaver_time_occupation,0),
Deezer_time_occupation=IFNULL(Deezer_time_occupation,0),
Dropbox_time_occupation=IFNULL(Dropbox_time_occupation,0),
eBay_time_occupation=IFNULL(eBay_time_occupation,0),
Facebook_time_occupation=IFNULL(Facebook_time_occupation,0),
GMail_time_occupation=IFNULL(GMail_time_occupation,0),
Google_time_occupation=IFNULL(Google_time_occupation,0),
GoogleDocs_time_occupation=IFNULL(GoogleDocs_time_occupation,0),
GoogleDrive_time_occupation=IFNULL(GoogleDrive_time_occupation,0),
GoogleHangoutDuo_time_occupation=IFNULL(GoogleHangoutDuo_time_occupation,0),
GoogleMaps_time_occupation=IFNULL(GoogleMaps_time_occupation,0),
GooglePlus_time_occupation=IFNULL(GooglePlus_time_occupation,0),
GoogleServices_time_occupation=IFNULL(GoogleServices_time_occupation,0),
HTTP_time_occupation=IFNULL(HTTP_time_occupation,0),
HTTP_Proxy_time_occupation=IFNULL(HTTP_Proxy_time_occupation,0),
IMO_time_occupation=IFNULL(IMO_time_occupation,0),
Instagram_time_occupation=IFNULL(Instagram_time_occupation,0),
LinkedIn_time_occupation=IFNULL(LinkedIn_time_occupation,0),
LotusNotes_time_occupation=IFNULL(LotusNotes_time_occupation,0),
Messenger_time_occupation=IFNULL(Messenger_time_occupation,0),
MS_OneDrive_time_occupation=IFNULL(MS_OneDrive_time_occupation,0),
MSN_time_occupation=IFNULL(MSN_time_occupation,0),
NetFlix_time_occupation=IFNULL(NetFlix_time_occupation,0),
Playstation_time_occupation=IFNULL(Playstation_time_occupation,0),
PlayStore_time_occupation=IFNULL(PlayStore_time_occupation,0),
PS_VUE_time_occupation=IFNULL(PS_VUE_time_occupation,0),
Sina_Weibo_time_occupation=IFNULL(Sina_Weibo_time_occupation,0),
Skype_time_occupation=IFNULL(Skype_time_occupation,0),
SkypeCall_time_occupation=IFNULL(SkypeCall_time_occupation,0),
Snapchat_time_occupation=IFNULL(Snapchat_time_occupation,0),
SoundCloud_time_occupation=IFNULL(SoundCloud_time_occupation,0),
Spotify_time_occupation=IFNULL(Spotify_time_occupation,0),
Steam_time_occupation=IFNULL(Steam_time_occupation,0),
TeamViewer_time_occupation=IFNULL(TeamViewer_time_occupation,0),
Telegram_time_occupation=IFNULL(Telegram_time_occupation,0),
TikTok_time_occupation=IFNULL(TikTok_time_occupation,0),
Tuenti_time_occupation=IFNULL(Tuenti_time_occupation,0),
Twitch_time_occupation=IFNULL(Twitch_time_occupation,0),
Twitter_time_occupation=IFNULL(Twitter_time_occupation,0),
Viber_time_occupation=IFNULL(Viber_time_occupation,0),
Waze_time_occupation=IFNULL(Waze_time_occupation,0),
WeChat_time_occupation=IFNULL(WeChat_time_occupation,0),
WhatsApp_time_occupation=IFNULL(WhatsApp_time_occupation,0),
WhatsAppCall_time_occupation=IFNULL(WhatsAppCall_time_occupation,0),
WhatsAppFiles_time_occupation=IFNULL(WhatsAppFiles_time_occupation,0),
Wikipedia_time_occupation=IFNULL(Wikipedia_time_occupation,0),
Xbox_time_occupation=IFNULL(Xbox_time_occupation,0),
Yahoo_time_occupation=IFNULL(Yahoo_time_occupation,0),
YouTube_time_occupation=IFNULL(YouTube_time_occupation,0),
Zoom_time_occupation=IFNULL(Zoom_time_occupation,0),
Amazon_data_occupation=IFNULL(Amazon_data_occupation,0),
AmazonVideo_data_occupation=IFNULL(AmazonVideo_data_occupation,0),
Apple_data_occupation=IFNULL(Apple_data_occupation,0),
AppleiCloud_data_occupation=IFNULL(AppleiCloud_data_occupation,0),
AppleiTunes_data_occupation=IFNULL(AppleiTunes_data_occupation,0),
AppleStore_data_occupation=IFNULL(AppleStore_data_occupation,0),
DataSaver_data_occupation=IFNULL(DataSaver_data_occupation,0),
Deezer_data_occupation=IFNULL(Deezer_data_occupation,0),
Dropbox_data_occupation=IFNULL(Dropbox_data_occupation,0),
eBay_data_occupation=IFNULL(eBay_data_occupation,0),
Facebook_data_occupation=IFNULL(Facebook_data_occupation,0),
GMail_data_occupation=IFNULL(GMail_data_occupation,0),
Google_data_occupation=IFNULL(Google_data_occupation,0),
GoogleDocs_data_occupation=IFNULL(GoogleDocs_data_occupation,0),
GoogleDrive_data_occupation=IFNULL(GoogleDrive_data_occupation,0),
GoogleHangoutDuo_data_occupation=IFNULL(GoogleHangoutDuo_data_occupation,0),
GoogleMaps_data_occupation=IFNULL(GoogleMaps_data_occupation,0),
GooglePlus_data_occupation=IFNULL(GooglePlus_data_occupation,0),
GoogleServices_data_occupation=IFNULL(GoogleServices_data_occupation,0),
HTTP_data_occupation=IFNULL(HTTP_data_occupation,0),
HTTP_Proxy_data_occupation=IFNULL(HTTP_Proxy_data_occupation,0),
IMO_data_occupation=IFNULL(IMO_data_occupation,0),
Instagram_data_occupation=IFNULL(Instagram_data_occupation,0),
LinkedIn_data_occupation=IFNULL(LinkedIn_data_occupation,0),
LotusNotes_data_occupation=IFNULL(LotusNotes_data_occupation,0),
Messenger_data_occupation=IFNULL(Messenger_data_occupation,0),
MS_OneDrive_data_occupation=IFNULL(MS_OneDrive_data_occupation,0),
MSN_data_occupation=IFNULL(MSN_data_occupation,0),
NetFlix_data_occupation=IFNULL(NetFlix_data_occupation,0),
Playstation_data_occupation=IFNULL(Playstation_data_occupation,0),
PlayStore_data_occupation=IFNULL(PlayStore_data_occupation,0),
PS_VUE_data_occupation=IFNULL(PS_VUE_data_occupation,0),
`Sina.Weibo._data_occupation`=IFNULL(`Sina.Weibo._data_occupation`,0),
Skype_data_occupation=IFNULL(Skype_data_occupation,0),
SkypeCall_data_occupation=IFNULL(SkypeCall_data_occupation,0),
Snapchat_data_occupation=IFNULL(Snapchat_data_occupation,0),
SoundCloud_data_occupation=IFNULL(SoundCloud_data_occupation,0),
Spotify_data_occupation=IFNULL(Spotify_data_occupation,0),
Steam_data_occupation=IFNULL(Steam_data_occupation,0),
TeamViewer_data_occupation=IFNULL(TeamViewer_data_occupation,0),
Telegram_data_occupation=IFNULL(Telegram_data_occupation,0),
TikTok_data_occupation=IFNULL(TikTok_data_occupation,0),
Tuenti_data_occupation=IFNULL(Tuenti_data_occupation,0),
Twitch_data_occupation=IFNULL(Twitch_data_occupation,0),
Twitter_data_occupation=IFNULL(Twitter_data_occupation,0),
Viber_data_occupation=IFNULL(Viber_data_occupation,0),
Waze_data_occupation=IFNULL(Waze_data_occupation,0),
WeChat_data_occupation=IFNULL(WeChat_data_occupation,0),
WhatsApp_data_occupation=IFNULL(WhatsApp_data_occupation,0),
WhatsAppCall_data_occupation=IFNULL(WhatsAppCall_data_occupation,0),
WhatsAppFiles_data_occupation=IFNULL(WhatsAppFiles_data_occupation,0),
Wikipedia_data_occupation=IFNULL(Wikipedia_data_occupation,0),
Xbox_data_occupation=IFNULL(Xbox_data_occupation,0),
Yahoo_data_occupation=IFNULL(Yahoo_data_occupation,0),
YouTube_data_occupation=IFNULL(YouTube_data_occupation,0),
Zoom_data_occupation=IFNULL(Zoom_data_occupation,0);

DROP TABLE IF EXISTS users;
CREATE TABLE users
SELECT DISTINCT src_ip_numeric AS user_id, cluster FROM clean_app_usage;

DROP TABLE IF EXISTS user_time_usage;
CREATE TABLE user_time_usage
SELECT src_ip_numeric, cluster,
(IFNULL(Amazon_time_occupation,0)+IFNULL(AmazonVideo_time_occupation,0)+IFNULL(Apple_time_occupation,0)+IFNULL(AppleiCloud_time_occupation,0)+IFNULL(AppleiTunes_time_occupation,0)+IFNULL(AppleStore_time_occupation,0)+IFNULL(DataSaver_time_occupation,0)+IFNULL(Deezer_time_occupation,0)+IFNULL(Dropbox_time_occupation,0)+IFNULL(eBay_time_occupation,0)+IFNULL(Facebook_time_occupation,0)+IFNULL(GMail_time_occupation,0)+IFNULL(Google_time_occupation,0)+IFNULL(GoogleDocs_time_occupation,0)+IFNULL(GoogleDrive_time_occupation,0)+IFNULL(GoogleHangoutDuo_time_occupation,0)+IFNULL(GoogleMaps_time_occupation,0)+IFNULL(GooglePlus_time_occupation,0)+IFNULL(GoogleServices_time_occupation,0)+IFNULL(HTTP_time_occupation,0)+IFNULL(HTTP_Proxy_time_occupation,0)+IFNULL(IMO_time_occupation,0)+IFNULL(Instagram_time_occupation,0)+IFNULL(LinkedIn_time_occupation,0)+IFNULL(LotusNotes_time_occupation,0)+IFNULL(Messenger_time_occupation,0)+IFNULL(MS_OneDrive_time_occupation,0)+IFNULL(MSN_time_occupation,0)+IFNULL(NetFlix_time_occupation,0)+IFNULL(Playstation_time_occupation,0)+IFNULL(PlayStore_time_occupation,0)+IFNULL(PS_VUE_time_occupation,0)+IFNULL(Sina_Weibo_time_occupation,0)+IFNULL(Skype_time_occupation,0)+IFNULL(SkypeCall_time_occupation,0)+IFNULL(Snapchat_time_occupation,0)+IFNULL(SoundCloud_time_occupation,0)+IFNULL(Spotify_time_occupation,0)+IFNULL(Steam_time_occupation,0)+IFNULL(TeamViewer_time_occupation,0)+IFNULL(Telegram_time_occupation,0)+IFNULL(TikTok_time_occupation,0)+IFNULL(Tuenti_time_occupation,0)+IFNULL(Twitch_time_occupation,0)+IFNULL(Twitter_time_occupation,0)+IFNULL(Viber_time_occupation,0)+IFNULL(Waze_time_occupation,0)+IFNULL(WeChat_time_occupation,0)+IFNULL(WhatsApp_time_occupation,0)+IFNULL(WhatsAppCall_time_occupation,0)+IFNULL(WhatsAppFiles_time_occupation,0)+IFNULL(Wikipedia_time_occupation,0)+IFNULL(Xbox_time_occupation,0)+IFNULL(Yahoo_time_occupation,0)+IFNULL(YouTube_time_occupation,0)+IFNULL(Zoom_time_occupation,0)) AS total_time
FROM clean_app_usage;

DROP TABLE IF EXISTS user_data_usage;
CREATE TABLE user_data_usage
SELECT src_ip_numeric, cluster,
(IFNULL(Amazon_data_occupation,0)+IFNULL(AmazonVideo_data_occupation,0)+IFNULL(Apple_data_occupation,0)+IFNULL(AppleiCloud_data_occupation,0)+IFNULL(AppleiTunes_data_occupation,0)+IFNULL(AppleStore_data_occupation,0)+IFNULL(DataSaver_data_occupation,0)+IFNULL(Deezer_data_occupation,0)+IFNULL(Dropbox_data_occupation,0)+IFNULL(eBay_data_occupation,0)+IFNULL(Facebook_data_occupation,0)+IFNULL(GMail_data_occupation,0)+IFNULL(Google_data_occupation,0)+IFNULL(GoogleDocs_data_occupation,0)+IFNULL(GoogleDrive_data_occupation,0)+IFNULL(GoogleHangoutDuo_data_occupation,0)+IFNULL(GoogleMaps_data_occupation,0)+IFNULL(GooglePlus_data_occupation,0)+IFNULL(GoogleServices_data_occupation,0)+IFNULL(HTTP_data_occupation,0)+IFNULL(HTTP_Proxy_data_occupation,0)+IFNULL(IMO_data_occupation,0)+IFNULL(Instagram_data_occupation,0)+IFNULL(LinkedIn_data_occupation,0)+IFNULL(LotusNotes_data_occupation,0)+IFNULL(Messenger_data_occupation,0)+IFNULL(MS_OneDrive_data_occupation,0)+IFNULL(MSN_data_occupation,0)+IFNULL(NetFlix_data_occupation,0)+IFNULL(Playstation_data_occupation,0)+IFNULL(PlayStore_data_occupation,0)+IFNULL(PS_VUE_data_occupation,0)+IFNULL(`Sina.Weibo._data_occupation`,0)+IFNULL(Skype_data_occupation,0)+IFNULL(SkypeCall_data_occupation,0)+IFNULL(Snapchat_data_occupation,0)+IFNULL(SoundCloud_data_occupation,0)+IFNULL(Spotify_data_occupation,0)+IFNULL(Steam_data_occupation,0)+IFNULL(TeamViewer_data_occupation,0)+IFNULL(Telegram_data_occupation,0)+IFNULL(TikTok_data_occupation,0)+IFNULL(Tuenti_data_occupation,0)+IFNULL(Twitch_data_occupation,0)+IFNULL(Twitter_data_occupation,0)+IFNULL(Viber_data_occupation,0)+IFNULL(Waze_data_occupation,0)+IFNULL(WeChat_data_occupation,0)+IFNULL(WhatsApp_data_occupation,0)+IFNULL(WhatsAppCall_data_occupation,0)+IFNULL(WhatsAppFiles_data_occupation,0)+IFNULL(Wikipedia_data_occupation,0)+IFNULL(Xbox_data_occupation,0)+IFNULL(Yahoo_data_occupation,0)+IFNULL(YouTube_data_occupation,0)+IFNULL(Zoom_data_occupation,0)) AS total_data
FROM clean_app_usage;

DROP TABLE IF EXISTS engagement_analysis;
CREATE TABLE engagement_analysis
SELECT t.src_ip_numeric, t.cluster, t.total_time, d.total_data,
(t.total_time + d.total_data) AS engagement_score
FROM user_time_usage t
JOIN user_data_usage d ON t.src_ip_numeric=d.src_ip_numeric;

DROP TABLE IF EXISTS cluster_behavior;
CREATE TABLE cluster_behavior
SELECT cluster, COUNT(*) total_users, AVG(total_time) avg_time, AVG(total_data) avg_data,
SUM(total_time) sum_time, SUM(total_data) sum_data, AVG(engagement_score) avg_engagement,
MAX(engagement_score) max_engagement, MIN(engagement_score) min_engagement
FROM engagement_analysis
GROUP BY cluster;

DROP TABLE IF EXISTS app_usage_ranking;
CREATE TABLE app_usage_ranking
SELECT 'Amazon' app_name, SUM(Amazon_time_occupation) total_time, SUM(Amazon_data_occupation) total_data FROM clean_app_usage UNION ALL
SELECT 'AmazonVideo', SUM(AmazonVideo_time_occupation), SUM(AmazonVideo_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Apple', SUM(Apple_time_occupation), SUM(Apple_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'AppleiCloud', SUM(AppleiCloud_time_occupation), SUM(AppleiCloud_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'AppleiTunes', SUM(AppleiTunes_time_occupation), SUM(AppleiTunes_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'AppleStore', SUM(AppleStore_time_occupation), SUM(AppleStore_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'DataSaver', SUM(DataSaver_time_occupation), SUM(DataSaver_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Deezer', SUM(Deezer_time_occupation), SUM(Deezer_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Dropbox', SUM(Dropbox_time_occupation), SUM(Dropbox_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'eBay', SUM(eBay_time_occupation), SUM(eBay_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Facebook', SUM(Facebook_time_occupation), SUM(Facebook_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GMail', SUM(GMail_time_occupation), SUM(GMail_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Google', SUM(Google_time_occupation), SUM(Google_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GoogleDocs', SUM(GoogleDocs_time_occupation), SUM(GoogleDocs_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GoogleDrive', SUM(GoogleDrive_time_occupation), SUM(GoogleDrive_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GoogleHangoutDuo', SUM(GoogleHangoutDuo_time_occupation), SUM(GoogleHangoutDuo_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GoogleMaps', SUM(GoogleMaps_time_occupation), SUM(GoogleMaps_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GooglePlus', SUM(GooglePlus_time_occupation), SUM(GooglePlus_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'GoogleServices', SUM(GoogleServices_time_occupation), SUM(GoogleServices_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'HTTP', SUM(HTTP_time_occupation), SUM(HTTP_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'HTTP_Proxy', SUM(HTTP_Proxy_time_occupation), SUM(HTTP_Proxy_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'IMO', SUM(IMO_time_occupation), SUM(IMO_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Instagram', SUM(Instagram_time_occupation), SUM(Instagram_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'LinkedIn', SUM(LinkedIn_time_occupation), SUM(LinkedIn_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'LotusNotes', SUM(LotusNotes_time_occupation), SUM(LotusNotes_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Messenger', SUM(Messenger_time_occupation), SUM(Messenger_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'MS_OneDrive', SUM(MS_OneDrive_time_occupation), SUM(MS_OneDrive_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'MSN', SUM(MSN_time_occupation), SUM(MSN_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'NetFlix', SUM(NetFlix_time_occupation), SUM(NetFlix_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Playstation', SUM(Playstation_time_occupation), SUM(Playstation_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'PlayStore', SUM(PlayStore_time_occupation), SUM(PlayStore_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'PS_VUE', SUM(PS_VUE_time_occupation), SUM(PS_VUE_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Sina_Weibo', SUM(Sina_Weibo_time_occupation), SUM(`Sina.Weibo._data_occupation`) FROM clean_app_usage UNION ALL
SELECT 'Skype', SUM(Skype_time_occupation), SUM(Skype_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'SkypeCall', SUM(SkypeCall_time_occupation), SUM(SkypeCall_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Snapchat', SUM(Snapchat_time_occupation), SUM(Snapchat_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'SoundCloud', SUM(SoundCloud_time_occupation), SUM(SoundCloud_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Spotify', SUM(Spotify_time_occupation), SUM(Spotify_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Steam', SUM(Steam_time_occupation), SUM(Steam_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'TeamViewer', SUM(TeamViewer_time_occupation), SUM(TeamViewer_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Telegram', SUM(Telegram_time_occupation), SUM(Telegram_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'TikTok', SUM(TikTok_time_occupation), SUM(TikTok_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Tuenti', SUM(Tuenti_time_occupation), SUM(Tuenti_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Twitch', SUM(Twitch_time_occupation), SUM(Twitch_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Twitter', SUM(Twitter_time_occupation), SUM(Twitter_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Viber', SUM(Viber_time_occupation), SUM(Viber_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Waze', SUM(Waze_time_occupation), SUM(Waze_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'WeChat', SUM(WeChat_time_occupation), SUM(WeChat_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'WhatsApp', SUM(WhatsApp_time_occupation), SUM(WhatsApp_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'WhatsAppCall', SUM(WhatsAppCall_time_occupation), SUM(WhatsAppCall_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'WhatsAppFiles', SUM(WhatsAppFiles_time_occupation), SUM(WhatsAppFiles_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Wikipedia', SUM(Wikipedia_time_occupation), SUM(Wikipedia_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Xbox', SUM(Xbox_time_occupation), SUM(Xbox_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Yahoo', SUM(Yahoo_time_occupation), SUM(Yahoo_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'YouTube', SUM(YouTube_time_occupation), SUM(YouTube_data_occupation) FROM clean_app_usage UNION ALL
SELECT 'Zoom', SUM(Zoom_time_occupation), SUM(Zoom_data_occupation) FROM clean_app_usage;

DROP TABLE IF EXISTS user_addiction_level;
CREATE TABLE user_addiction_level
SELECT src_ip_numeric, cluster, engagement_score,
CASE
WHEN engagement_score < 50000 THEN 'Low Usage'
WHEN engagement_score BETWEEN 50000 AND 200000 THEN 'Moderate Usage'
WHEN engagement_score BETWEEN 200000 AND 600000 THEN 'High Usage'
ELSE 'Addicted'
END AS addiction_level
FROM engagement_analysis;

DROP TABLE IF EXISTS dashboard_master;
CREATE TABLE dashboard_master
SELECT u.user_id, e.cluster, e.total_time, e.total_data, e.engagement_score, a.addiction_level
FROM users u
JOIN engagement_analysis e ON u.user_id=e.src_ip_numeric
JOIN user_addiction_level a ON u.user_id=a.src_ip_numeric;

DROP TABLE IF EXISTS validation_report;
CREATE TABLE validation_report
SELECT
(SELECT COUNT(*) FROM raw_app_usage) AS raw_rows,
(SELECT COUNT(*) FROM clean_app_usage) AS clean_rows,
(SELECT COUNT(*) FROM raw_app_usage) - (SELECT COUNT(*) FROM clean_app_usage) AS duplicates_removed,
(SELECT COUNT(*) FROM users) AS unique_users,
(SELECT COUNT(*) FROM user_time_usage) AS time_rows,
(SELECT COUNT(*) FROM user_data_usage) AS data_rows,
(SELECT COUNT(*) FROM engagement_analysis) AS engagement_rows,
(SELECT COUNT(*) FROM app_usage_ranking) AS apps_tracked,
(SELECT COUNT(*) FROM user_addiction_level) AS addiction_classified,
(SELECT COUNT(*) FROM dashboard_master) AS dashboard_rows;

DROP TABLE IF EXISTS insights_summary;
CREATE TABLE insights_summary (
insight_category VARCHAR(100),
insight_name VARCHAR(200),
insight_value VARCHAR(500)
);

INSERT INTO insights_summary (insight_category, insight_name, insight_value)
SELECT 'Platform Overview', 'Total Raw Rows', CAST((SELECT COUNT(*) FROM raw_app_usage) AS CHAR) UNION ALL
SELECT 'Platform Overview', 'Total Clean Rows', CAST((SELECT COUNT(*) FROM clean_app_usage) AS CHAR) UNION ALL
SELECT 'Platform Overview', 'Duplicates Removed', CAST((SELECT COUNT(*) FROM raw_app_usage) - (SELECT COUNT(*) FROM clean_app_usage) AS CHAR) UNION ALL
SELECT 'Platform Overview', 'Total Unique Users', CAST((SELECT COUNT(*) FROM users) AS CHAR) UNION ALL
SELECT 'Platform Overview', 'Apps Tracked', CAST((SELECT COUNT(*) FROM app_usage_ranking) AS CHAR) UNION ALL
SELECT 'Time Analysis', 'Platform Total Time', CAST((SELECT ROUND(SUM(total_time),2) FROM user_time_usage) AS CHAR) UNION ALL
SELECT 'Time Analysis', 'Average User Time', CAST((SELECT ROUND(AVG(total_time),2) FROM user_time_usage) AS CHAR) UNION ALL
SELECT 'Time Analysis', 'Max User Time', CAST((SELECT ROUND(MAX(total_time),2) FROM user_time_usage) AS CHAR) UNION ALL
SELECT 'Time Analysis', 'Min User Time', CAST((SELECT ROUND(MIN(total_time),2) FROM user_time_usage) AS CHAR) UNION ALL
SELECT 'Data Analysis', 'Platform Total Data', CAST((SELECT ROUND(SUM(total_data),2) FROM user_data_usage) AS CHAR) UNION ALL
SELECT 'Data Analysis', 'Average User Data', CAST((SELECT ROUND(AVG(total_data),2) FROM user_data_usage) AS CHAR) UNION ALL
SELECT 'Data Analysis', 'Max User Data', CAST((SELECT ROUND(MAX(total_data),2) FROM user_data_usage) AS CHAR) UNION ALL
SELECT 'Data Analysis', 'Min User Data', CAST((SELECT ROUND(MIN(total_data),2) FROM user_data_usage) AS CHAR) UNION ALL
SELECT 'Engagement', 'Overall Avg Engagement Score', CAST((SELECT ROUND(AVG(engagement_score),2) FROM engagement_analysis) AS CHAR) UNION ALL
SELECT 'Engagement', 'High Engagement Users (>500000)', CAST((SELECT COUNT(*) FROM engagement_analysis WHERE engagement_score > 500000) AS CHAR) UNION ALL
SELECT 'Engagement', 'Low Engagement Users (<50000)', CAST((SELECT COUNT(*) FROM engagement_analysis WHERE engagement_score < 50000) AS CHAR) UNION ALL
SELECT 'App Ranking', 'Most Used App By Time', (SELECT app_name FROM app_usage_ranking ORDER BY total_time DESC LIMIT 1) UNION ALL
SELECT 'App Ranking', 'Most Used App By Data', (SELECT app_name FROM app_usage_ranking ORDER BY total_data DESC LIMIT 1) UNION ALL
SELECT 'Addiction', 'Low Usage Users', CAST((SELECT COUNT(*) FROM user_addiction_level WHERE addiction_level='Low Usage') AS CHAR) UNION ALL
SELECT 'Addiction', 'Moderate Usage Users', CAST((SELECT COUNT(*) FROM user_addiction_level WHERE addiction_level='Moderate Usage') AS CHAR) UNION ALL
SELECT 'Addiction', 'High Usage Users', CAST((SELECT COUNT(*) FROM user_addiction_level WHERE addiction_level='High Usage') AS CHAR) UNION ALL
SELECT 'Addiction', 'Addicted Users', CAST((SELECT COUNT(*) FROM user_addiction_level WHERE addiction_level='Addicted') AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 0 Users', CAST((SELECT COUNT(*) FROM users WHERE cluster=0) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 1 Users', CAST((SELECT COUNT(*) FROM users WHERE cluster=1) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 2 Users', CAST((SELECT COUNT(*) FROM users WHERE cluster=2) AS CHAR) UNION ALL
SELECT 'Cluster', 'Most Engaged Cluster', CAST((SELECT cluster FROM engagement_analysis GROUP BY cluster ORDER BY AVG(engagement_score) DESC LIMIT 1) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 0 Avg Time', CAST((SELECT ROUND(AVG(total_time),2) FROM engagement_analysis WHERE cluster=0) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 1 Avg Time', CAST((SELECT ROUND(AVG(total_time),2) FROM engagement_analysis WHERE cluster=1) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 2 Avg Time', CAST((SELECT ROUND(AVG(total_time),2) FROM engagement_analysis WHERE cluster=2) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 0 Avg Data', CAST((SELECT ROUND(AVG(total_data),2) FROM engagement_analysis WHERE cluster=0) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 1 Avg Data', CAST((SELECT ROUND(AVG(total_data),2) FROM engagement_analysis WHERE cluster=1) AS CHAR) UNION ALL
SELECT 'Cluster', 'Cluster 2 Avg Data', CAST((SELECT ROUND(AVG(total_data),2) FROM engagement_analysis WHERE cluster=2) AS CHAR);

SELECT * FROM app_used_time LIMIT 100;
SELECT * FROM raw_app_usage LIMIT 100;
SELECT * FROM clean_app_usage LIMIT 100;
SELECT * FROM users;
SELECT * FROM user_time_usage ORDER BY total_time DESC;
SELECT * FROM user_data_usage ORDER BY total_data DESC;
SELECT * FROM engagement_analysis ORDER BY engagement_score DESC;
SELECT * FROM cluster_behavior ORDER BY avg_engagement DESC;
SELECT * FROM app_usage_ranking ORDER BY total_time DESC;
SELECT * FROM user_addiction_level ORDER BY engagement_score DESC;
SELECT * FROM dashboard_master ORDER BY engagement_score DESC;
SELECT * FROM validation_report;
SELECT * FROM insights_summary ORDER BY insight_category, insight_name;