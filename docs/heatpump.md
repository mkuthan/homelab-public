# Heat pump system

## Heishamon

Factory reset:

1. Hold `flash` button for 10 seconds until the LED starts flashing rapidly.
2. Press `reset` button.
3. Navigate to [http://192.168.4.1](http://192.168.4.1)

AP authentication:

Username: `admin`
Password: `heisha`

MQTT settings:

- Server: `192.168.10.10`
- Port: `1883`
- Credentials: `ansible-vault view host_vars/mqtt`
  
Pooling:

- Interval: `30` seconds
- MQTT retransmit interval: `300` seconds

Time:

- NTP server: `pool.ntp.org`
- Timezone: `ETC/GMT`
