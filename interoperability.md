# Assess interoperability of Presentation API implementations

This document discusses the interoperability of potential Presentation API implementations in particular interoperability
between user agents in case of [2-UA implementations][2ua] and between user agents and presentation displays in case of [1-UA implementations][1ua].
For this, state of the art technologies and standards that may be useful to implement the Presentation API will be considered.

## Interoperability between user agents

The following diagram shows an overview of the main components for the 2-UA implementation. Each of the user agents implements
part of the Presentation API (for controlling browsing context or presenting browsing context). To ensure interoperability
between user agents running on controller devices and user agents running on presentation devices the following aspects should be considered:

* **Discovery**: To discover presentation devices, the controlling user agent should use the same technology as the presenting
user agent use to advertise itself. **Potential technologies**: SSDP, mDNS or BLE (BLE Beacon)
* **Launch**: After discovery, the controlling user agent should know how to launch a new presentation or join an existing one.
Common message formats should be also used. **Potential technologies**: DIAL (uses SSDP for discovery), Google Cast (part of it).
* **Communication**: Also for communication both user agents should use same technologies/protocols to ensure interoperability.
**Potential technologies**: WebSockets, WebRTC, Raw Socket, Google Cast (part of it)
* **Signaling**: common language and message formats (e.g. using JSON or XML) should be used to exchange signaling information between the two user agents.

![2-UA implementation][2ua-img]

## Interoperability between user agents and dump displays

The following diagram shows an overview of the main components for the 1-UA Implementation. There are less requirements
as in the 2-UA case to ensure interoperability between controlling user agents and presentation displays.
The controlling user agent implements the Presentation API for both controlling and presenting browsing contexts and the presentation
page is rendered in silent mode (not visible for the user). The user agent captures the UI output of the presentation page rendered
in silent mode and sends the frames to a presentation device like a projector or wireless display. This means the user agent and the
presentation device should use a common streaming technology to ensure interoperability. More than likely, the user agent will use System APIs
offered by the OS to show content on the presentation device. But other technologies not offered directly by the OS are also possible, for example
 Google Cast extension for chrome supports Tab cast to Chromecast using WebRTC. **Potentials Technologies**: HDMI, Intel WiDi, Miracast, Airplay, MHL.

![1-UA implementation][1ua-img]

[1ua]: http://w3c.github.io/presentation-api/#1-ua
[2ua]: http://w3c.github.io/presentation-api/#2-ua
[1ua-img]: ./images/interoperability-1ua.png
[2ua-img]: ./images/interoperability-2ua.png