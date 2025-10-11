# Photo Voltaic System

## Inverter

* Model: *Solis S6-EH3P12K02-NV-YD-L*
* Version: *060008-080005* (14.08.2025)

### Battery related configuration

* *Force Charge 5%* – Regardless of everything else, once the battery reaches this level,
  it will be charged from the grid up to the level specified by *Recovery 25%*.
* *Over Discharge 10%* – At this level, the inverter stops drawing energy from the battery
  and also cuts off the backup output in the event of a grid failure.
* *Batt Reserve 20-100%* – At this level, the inverter stops drawing energy from the battery, unless there is a grid failure,
  in which case it will supply the backup output until *Over Discharge* is reached.
* *Max Charge SOC 100%* – I allow the battery to be charged to full capacity.
* *Allow Grid Charge ON* – The battery can be charged from the grid if needed.
  the inverter will still charge it from the grid.
* *Battery Saving ON* – When the SOC is below Batt Reserve, the inverter draws energy from the grid for its own needs,
  without using up my reserve.

### Storage modes

* `BIT00` - Self-Use mode switch - Storage Mode "Self use"
* `BIT01` - Time of Use switch - TODO
* `BIT02` - Off-Grid mode switch - Storage Mode "Off-Grid"
* `BIT03` - Battery wake-up switch - TODO
* `BIT04` - Back-up mode switch - Battery Reserve Switch "ON/OFF"
* `BIT05` - Allow charging from the grid - Allow Grid Charge "ON/OFF"
* `BIT06` - Feed-In priority mode switch - Storage Mode "Selling first"
* `BIT07` - Night battery over-discharge hold - TODO
* `BIT08` - Dynamic regulation enable when force-charging - TODO
* `BIT09` - Battery current correction enable - TODO
* `BIT10` - Battery treatment mode - TODO
* `BIT11` - Peak-shaving mode switch - Grid Peak Shaving "ON/OFF"
* `BIT12` - Reserve
* `BIT13` - Reserve
* `BIT14` - Reserve
* `BIT15` - Reserve  

> Either Self Use or Feed In Priority mode must be turned ON, turning one on will automatically turn the other off.
> Backup mode can be turned on independently of Self Use and Feed In Priority as this mode determines how the system
> will behave when the grid goes down.
> Off Grid mode should only be turned on if the system is installed with no grid connection at all.

Examples for "Self-Use" mode:

* 1 (decimal), 0000 0000 0000 001 (binary) - grid charge OFF
* 17 (decimal), 0000 0000 0001 0001 (binary) - grid charge OFF, back-up mode ON
* 49 (decimal), 0000 0000 0011 0001 (binary) - grid charge ON, back-up mode ON,

Examples for "Feed-In" mode:

* 64 (decimal), 0000 0000 0100 0000 (binary) - grid-charge OFF
* 80 (decimal), 0000 0000 0101 0000 (binary) - grid-charge OFF, back-up mode ON
* 112 (decimal), 0000 0000 0111 0000 (binary) - grid-charge ON, back-up mode ON

Documentation:

* [Energy Storage Operating Modes](https://usservice.solisinverters.com/support/solutions/articles/73000560490-energy-storage-operating-modes)
* [Self-Use mode](https://usservice.solisinverters.com/support/solutions/articles/73000558744-11-of-20-energy-storage-operating-modes-self-use)
* [Feed-In mode](https://usservice.solisinverters.com/support/solutions/articles/73000558755-12-of-20-energy-storage-operating-modes-feed-in-priority)

### Time of Use

Self-Use Mode:

* "discharge slot" - battery -> grid
* "charge slot" - doesn't matter if charging from grid isn't allowed
* "out of defined slots" - solar -> load -> battery

Feed-In Priority Mode:

* "discharge slot" - battery -> grid
* "charge slot" - solar -> battery (but load from grid only)
* "out of defined slots" - solar -> load -> grid

## Data logger

* Model: *S2-WL-ST*
* Version: *1001318c*

## Battery

* Sunwooda Atrix LV, 10kWh

## Solar Panels

* AIKO-A450-MAH54DW, 6.3kWp
