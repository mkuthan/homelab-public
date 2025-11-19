# Home Assistant

## Automations

* Solar & HVAC energy management <https://github.com/mkuthan/home-assistant-appdaemon>
* Solar energy management v1 <https://github.com/mkuthan/home-assistant-appdaemon>
* CCTV, heating, lighting and more automations <https://mkuthan.github.io/blog/2024/12/08/home-assistant-automations/>

## Integrations

* [Android TV Remote](https://www.home-assistant.io/integrations/androidtv_remote)
* [Auto Backup](https://github.com/jcwillox/hass-auto-backup)
* [Bambu Lab](https://github.com/greghesp/ha-bambulab)
* [Electricity Maps](https://www.home-assistant.io/integrations/co2signal)
* [ESPHome](https://www.home-assistant.io/integrations/esphome)
* [Frigate](https://github.com/blakeblackshear/frigate)
* [Google Cast](https://www.home-assistant.io/integrations/cast)
* [Google Cloud](https://www.home-assistant.io/integrations/google_cloud)
* [Google Generative AI](https://www.home-assistant.io/integrations/google_generative_ai_conversation)
* [HACS](https://hacs.xyz/docs/use/)
* [HeishaMon](https://github.com/kamaradclimber/heishamon-homeassistant)
* [Home Connect](https://www.home-assistant.io/integrations/home_connect)
* [IMGW-PIB](https://www.home-assistant.io/integrations/imgw_pib)
* [LG webOS TV](https://www.home-assistant.io/integrations/webostv/)
* [Local Calendar](https://www.home-assistant.io/integrations/local_calendar)
* [Local To-do](https://www.home-assistant.io/integrations/local_todo)
* [Meteorologisk institutt](https://www.home-assistant.io/integrations/met)
* [Mobile App](https://www.home-assistant.io/integrations/mobile_app)
* [Moon](https://www.home-assistant.io/integrations/moon)
* [MQTT](https://www.home-assistant.io/integrations/mqtt)
* [Proximity](https://www.home-assistant.io/integrations/proximity)
* [Radio Browser](https://www.home-assistant.io/integrations/radio_browser)
* [Risco](https://www.home-assistant.io/integrations/risco)
* [Rynkowa Cena Energii](https://github.com/Lewa-Reka/ha-rce-pse)
* [Season](https://www.home-assistant.io/integrations/season)
* [Shelly](https://www.home-assistant.io/integrations/shelly)
* [SMLIGHT](https://www.home-assistant.io/integrations/smlight)
* [Solcast PV Forecast](https://github.com/BJReplay/ha-solcast-solar)
* [Solis Cloud Control Integration](https://github.com/mkuthan/solis-cloud-control)
* [Solis Inverter](https://github.com/hultenvp/solis-sensor/)
* [Spook](https://spook.boo/)
* [Sun](https://www.home-assistant.io/integrations/sun)
* [Universal Media Player](https://www.home-assistant.io/integrations/universal)
* [WebRTC Camera](https://github.com/AlexxIT/WebRTC)
* [Wyoming Protocol](https://www.home-assistant.io/integrations/wyoming)

Retired integrations:

* [Aquarea Smart Cloud](https://github.com/cjaliaga/home-assistant-aquarea)
* [ENTSO-e](https://github.com/JaccoR/hass-entso-e)
* [Forecast.Solar](https://www.home-assistant.io/integrations/forecast_solar)
* [Music Assistant](https://www.home-assistant.io/integrations/music_assistant)
* [PrusaLink](https://www.home-assistant.io/integrations/prusalink)
* [RESTful](https://www.home-assistant.io/integrations/rest)
* [Retry](https://github.com/amitfin/retry)
* [TP-Link Omada](https://www.home-assistant.io/integrations/tplink_omada)


## Add-ons

* AppDaemon
* Studio Code Server
* Music Assistant Server (unused)
* Open Wake World
* Pipper
* SQLite Web
* Whsiper
* Zigbee2MQTT Proxy

## Dashboard add-ons

* [Advanced Camera Card](https://github.com/dermotduffy/advanced-camera-card)
* [ApexCharts Card](https://github.com/RomRider/apexcharts-card)
* [Auto Entities](https://github.com/thomasloven/lovelace-auto-entities)
* [Card Mod](https://github.com/thomasloven/lovelace-card-mod)
* [Mini Media Player](https://github.com/kalkih/mini-media-player)
* [Mushroom](https://github.com/piitaya/lovelace-mushroom)
* [Power Flow Card Plus](https://github.com/flixlix/power-flow-card-plus)
* [Trash Card](https://github.com/idaho/hassio-trash-card)

## Database statistics

Top 50 entities by number of state changes in the last 7 days (604800 seconds):

```sql
WITH recent_states AS (
  SELECT
    s.metadata_id,
    s.last_updated_ts
  FROM states s
  WHERE s.last_updated_ts > strftime('%s','now') - 604800
)
SELECT
  sm.entity_id,
  COUNT(*) AS state_rows
FROM recent_states rs
JOIN states_meta sm ON rs.metadata_id = sm.metadata_id
GROUP BY sm.entity_id
ORDER BY state_rows DESC
LIMIT 50;
```
