# Photo Voltaic System

## Inverter

Model:

* Solis S6-EH3P12K02-NV-YD-L

Configuration:

* *Force Charge 10%* – Regardless of everything else, once the battery reaches this level, it will be charged from the grid up to the level specified by *Recovery 25%*.
* *Over Discharge 15%* – At this level, the inverter stops drawing energy from the battery and also cuts off the backup output in the event of a grid failure.
* *Batt Reserve 25%* – At this level, the inverter stops drawing energy from the battery, unless there is a grid failure, in which case it will supply the backup output until *Over Discharge* is reached.
* *Max Charge SOC 100%* – I allow the battery to be charged to full capacity.
* *Allow Grid Charge OFF* – The battery is charged only from solar, but if the SOC drops to Force Charge, the inverter will still charge it from the grid.
* *Battery Saving ON* – When the SOC is below Batt Reserve, the inverter draws energy from the grid for its own needs, without using up my reserve.

## Battery

* Sunwooda Atrix LV, 10kWh

## Solar Panels

* AIKO-A450-MAH54DW, 6.3kWp
