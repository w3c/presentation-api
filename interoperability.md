# Assess interoperability of Presentation API implementations

This document discusses the interoperability of potential Presentation API
implementations; in particular, interoperability between user agents in case of
[2-UA implementations][2ua] and between user agents and presentation displays in
case of [1-UA implementations][1ua].  For this, state of the art technologies
and standards that may be useful to implement the Presentation API will be
considered.

## Interoperability between user agents (2-UA)

The following diagram shows an overview of the main components for the 2-UA
implementation. Each of the user agents implements part of the Presentation API
(for controlling browsing context or presenting browsing context).


![2-UA implementation][2ua-img]

To ensure interoperability between user agents running on controller devices and
user agents running on presentation devices the following aspects should be
considered:

- **Discovery**: To discover presentation devices, the controlling user agent
  should use the same technology as the presenting user agent uses to advertise
  itself.
  - **Potential technologies**: [SSDP](http://upnp.org/sdcps-and-certification/standards/device-architecture-documents/), [mDNS/DNS-SD](http://www.dns-sd.org/) or [Bluetooth Low Energy](http://www.bluetooth.com/Pages/low-energy-tech-info.aspx).
- **Launch**: after discovery, the controlling user agent should know how to
  launch a new presentation or join an existing one. Common message formats
  should be also used.
  - **Potential technologies**: [DIAL](http://www.dial-multiscreen.org/dial-protocol-specification) (uses SSDP for discovery), [Google Cast](https://developers.google.com/cast/?hl=en) (part of it), HBBTv 2.0 (see https://github.com/w3c/presentation-api/issues/67).
- **Communication**: also for communication both user agents should use same
technologies/protocols to ensure interoperability.
  - **Potential technologies**: [WebSockets](https://tools.ietf.org/html/rfc6455), [WebRTC](http://www.webrtc.org/), Raw Socket, Google Cast (part of it).
- **Signaling**: Common language and message formats (e.g. using JSON or XML)
  should be used to exchange signaling information between the two user agents.
- **Security**: Means of authenticatating the presenting user agent to the
  controlling user agent (and vice versa), and ensuring privacy of communication.
  - **Potential technologies**: [TLS](https://tools.ietf.org/html/rfc5246), [DTLS-SRTP](https://tools.ietf.org/html/rfc5764), [X.509 Certificates](https://tools.ietf.org/html/rfc5280).


## Interoperability between user agents and presentation displays (1-UA)

The following diagram shows an overview of the main components for the 1-UA
implementation.  There are fewer requirements than the 2-UA case for
interoperability between controlling user agents and presentation displays.  The
controlling user agent implements the Presentation API for both controlling and
presenting browsing contexts and the presentation page is rendered in silent
mode (not visible for the user).  The controlling user agent captures the UI
output of the presentation page and sends the frames to a presentation device
like a projector or wireless display.

![1-UA implementation][1ua-img]

The controlling user agent and the presentation device must implement a common
streaming technology to interoperate. More than likely, the user agent will use
system APIs offered by the OS to show content on the presentation device. But
other technologies not offered directly by the OS are also possible; for
example, the Google Cast extension for Chrome supports mirroring tabs to
Chromecast using WebRTC.

**Potential Technologies**: [HDMI](http://www.hdmi.org/), [Intel WiDi](http://www.intel.com/content/www/us/en/architecture-and-technology/intel-wireless-display.html), [Miracast](http://www.wi-fi.org/discover-wi-fi/wi-fi-certified-miracast), [Airplay](http://www.apple.com/airplay/), [MHL](http://www.mhlconsortium.org/), WebRTC.

[1ua]: http://w3c.github.io/presentation-api/#1-ua
[2ua]: http://w3c.github.io/presentation-api/#2-ua
[1ua-img]: ./images/interoperability-1ua.png
[2ua-img]: ./images/interoperability-2ua.png
