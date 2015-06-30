# Use cases and requirements for Presentation API

This document captures the [use cases](#use-cases) and
[requirements](#requirements) to consider in the specification of the
[W3C Presentation API][pres-api].

## Use Cases

This section collects relevant use cases for the [Presentation API][pres-api].

> Each use case is defined in its own subsection. To define a new use case just
> copy/paste an existing one and update the use case identifier (UCxx), title,
> description and requirements.

### <a name="uc01"></a>UC01: Presentation

A user is preparing a set of slides for a talk. Using a web-based service, she
is editing her slides and speaker notes on the primary screen while the
secondary larger screen shows a preview of the current slide. When the slides
are done, her mobile phone allows her to access them from an online service
while on the go. Coming to the conference, using wireless display technology,
she would like to present her slides on the stage screen from her mobile phone.
The phone's touch screen helps her to navigate slides and presents a slide
preview while the projector shows her slides to the audience.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ05](#req05), [REQ06](#req06)

### <a name="uc02"></a>UC02: Video and image sharing

Using an online video or image sharing service, a user would like to show
memorable moments to her friends. Using a device with a small screen, however, a
user cannot show the content to a large group of people. Connecting an external
TV screen or projector to her device - with a cable or wirelessly - the online
sharing service now makes use of the connected display, allowing a wider
audience to enjoy the content. The web page shows UI elements that allow the
user to trigger displaying content on the secondary display (e.g., a "send to
second screen") only if there is at least one presentation display available.
The user selects a set of videos and images to show on the second display. The playback
starts on the secondary display and will continue even if the user navigates to another
web page on his mobile device. The user can navigate back to the online sharing service
and the controlling page will connect automatically to the running session on the
presentation display.


**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ03](#req03), [REQ05](#req05), [REQ06](#req06)

### <a name="uc03"></a>UC03: Multiplayer gaming - Poker

Bob enters an online poker site on his smartphone to play poker with friends. He
selects the option "create new game" to start a game session for two
players. The poker site detects that there is display available and asks Bob to
extend the game UI by keeping his personal cards and control UI on the
smartphone and displaying the poker table on the large display. Bob confirms and
waits for other players to join. Alice is visiting Bob and decides to join the
game.  She opens the same poker site in the browser on her smartphone and
selects the option "join game". The browser shows a dialog with a list of
running poker sessions. She selects the session started by Bob and joins the
game. The game starts immediately after two players are joined. Now Alice and
Bob can see their personal cards on their smartphones and the large screen
displays the poker table with shared cards, current bets, and remaining money of
each player.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ04](#req04), [REQ05](#req05), [REQ06](#req06), [REQ07](#req07)

**Images**

* <a name="uc03-img1"></a>Poker Table

    ![Poker Table][uc03-img1]

* <a name="uc03-img2"></a>Poker Player: Alice

    ![Poker Client: Alice][uc03-img2]

* <a name="uc03-img3"></a>Poker Player: Bob

    ![Poker Client: Bob][uc03-img3]

### <a name="uc04"></a>UC04: Media flinging to multiple screens

Alice enters a video sharing site using a browser on her tablet. Next, Alice
picks her favorite video from the site, and the video starts to play on her
tablet. While the video is playing Alice clicks a button "Share on different
screen".  The browser provides a user interface that lists all the screens Alice
has at her home, asking her to select one.  The screens are identified by names
that are familiar to Alice. Alice picks one screen from the list, "Alice's big
TV", and the video playback continues seamlessly on the selected screen. Next
she decides to switch the playback to a different screen. She clicks the same
button "Share on different screen" provided by the site, and the browser
presents the user interface that lists all the screens. Alice picks another
screen from the list, "Alice's kitchen TV", and the playback resumes on that
screen. Video site also provides a feature to see the action (Alice is watching
a soccer game) from a different angle. Alice clicks a button "Select screen for
additional angle", and the browser asks Alice similarly to select the screen for
playback. Alice picks "Alice's Projector" and the soccer game is shown on the
projector from a different angle, in parallel to the content being played back
on "Alice's kitchen TV".

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ05](#req05), [REQ06](#req06), [REQ08](#req08)

> ISSUE #40: [Screen availability mechanism for multiple
> sessions](https://github.com/w3c/presentation-api/issues/40)

## Requirements

This section collects all requirements derived from the [use cases](#use-cases)
listed in the previews section.

> Each requirement is defined in its own subsection. To define a new requirement
> just copy/paste an existing one and update the identifier (REQxx), title and
> description.

### <a name="req01"></a>REQ01: Discovery & availability

The UA must provide a way to find out whether at least one
[presentation display](https://w3c.github.io/presentation-api/#presentation-display)
is available.

### <a name="req02"></a>REQ02: Launching presentation

The UA must provide a way to start sending content to a presentation display or
displays from a
[controlling browsing context](https://w3c.github.io/presentation-api/#controlling-browsing-context)
(or <em>controller</em>), which creates a new
[presenting browsing context](https://w3c.github.io/presentation-api/#presenting-browsing-context)
(or <em>presentation</em>). This may occur at the request of the controller or
at the request of the UA. A single controller may be able to send content to
multiple displays at once, and a single display may be able to host multiple
presentations at once.

### <a name="req03"></a>REQ03: Resuming connection to presentation

If a controller becomes disconnected from its presentation, the UA must provide
a way for it to resume its connection to the presentation. It must also provide
a way for a new browsing context on the same UA to request connection to one or
more presentations (thus becoming their controller).

### <a name="req04"></a>REQ04: Joining presentation

The UA on the controller device must provide a way for controlling browsing context
to join running presentations. These are started in general either manually
by the user or from another controller as described in [REQ02](#req02).

### <a name="req05"></a>REQ05: Communication

The UA must enable exchange of data between a presentation and its controller or
controllers. This data exchange can be used to determine what content is shown
in the presentation. The UAs that host the controllers must not make an
assumption about the execution locality of the UA that hosts the presentation;
they may be rendered on one or more remote UAs, and thus the communication
channels between a presentation and its controllers
is loosely coupled.

### <a name="req06"></a>REQ06: Signaling disconnection

The UA must signal disconnection between a controller and a presentation to both
the controller and the presentation. The controller or the presentation may
choose to initiate disconnection; in that case, the UA must signal disconnection
to the other side.

### <a name="req07"></a>REQ07: Multiple controllers per presentation

A presentation should be able to accept control (via data exchange) from
multiple controllers simultaneously. Not all presentations will support this;
for example, when the presentation browsing context is not accessible to other
devices.

### <a name="req08"></a>REQ08: Multiple presentations per controller

A single controller should be able to launch multiple presentations and exchange
data with them. Each connection between a controller and a presentation is
handled independently by the UA; controlling the same content on multiple
presentations simultaneously in a synchronized fashion is out of scope for this
specification.

## Non-functional Requirements

### <a name="nf-req01"></a>NF-REQ01: Power saving friendly

All API design decisions must be analyzed from a power efficiency point of
view. Especially when using wireless display technologies or querying
availability over a radio channel, care needs to be taken to design the API in a
way that does not pose obstacles to using radio resources in an efficient
way. For example, powering up the wireless display detection only when
needed.


[pres-api]: http://w3c.github.io/presentation-api/
[uc03-img1]: ./images/uc-multiplayer-game-poker-table.png
[uc03-img2]: ./images/uc-multiplayer-game-player-alice.png
[uc03-img3]: ./images/uc-multiplayer-game-player-bob.png
