This program configures an Arduino repeater via a serial link (typically a USB serial Arduino programmer) to control tge frequencies and modes that it uses to listen for a HAB packet and then repeat it.

Capabilities
------------

- Allows the LoRa frequency, bandwidth etc. to be set
- Displays RSSI etc from the LoRa module


Firmware
--------

Matching firmware for Arduino here - [https://github.com/daveake/LoRaRepeater](https://github.com/daveake/LoRaRepeater "https://github.com/daveake/LoRaRepeater")

The serial protocol is described there.

Build
-----

The program was developed using Delphi 2009 with the TMS Async component for serial comms with the Arduino.  I've not tried but it should build fine with older or new Delphi versions, so long as that component is installed.

If you prefer something built with open source software, feel free to write in Python or whatever using the source and documentation as a guide; should be pretty easy.

History
-------

09/04/2019	V1.0	- Updated README

05/04/2019	V1.0	- First release
