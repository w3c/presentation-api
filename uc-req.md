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

A user is preparing a set of slides for a talk. Using a Web-based service, she
edits her slides and speaker notes on the primary screen while the secondary
larger screen shows a preview of the current slide.  When the slides are done,
her mobile phone allows her to access them from an online service while on the
go.  At the conference, using wireless display technology, she presents her
slides on the stage screen from her mobile phone.  The phone's touch screen
helps her to navigate slides and presents a slide preview while the stage screen
shows her slides to the audience.  At the end of the presentaton, she clicks a
button to stop presentation, which stops showing slides on the stage screen and
reverts to a local view of the presentation on her mobile phone.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ05](#req05), [REQ06](#req06), [REQ09](#req09)

### <a name="uc02"></a>UC02: Video and image sharing

Using an online video or image sharing service, a user would like to show
memorable moments to her friends.  However, she cannot show the content to a
large group of people using her smartphone with its small screen.  She connects
an external TV screen to her mobile device (wired or wirelessly); the online
sharing service now makes use of the connected display, allowing a wider
audience to enjoy the content.  After the connection is made, the Web page adds
a button (e.g., "send to second screen") that allows her to send content to
the TV screen.

She clicks the "send to second screen" button to start display on her
TV screen, then selects a set of videos and images to show there. The playback
starts on the TV screen and continues even after she navigates to another Web
page on her mobile device.  She navigates back to the online sharing service and
the site reconnects automatically to the content shown on the TV screen.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ03](#req03), [REQ05](#req05), [REQ06](#req06)

### <a name="uc03"></a>UC03: Multiplayer gaming - Poker

Bob enters an online poker site on his smartphone to play poker with friends. He
selects the option "create new game" to start a game session for two
players. The poker site detects that there is display available and asks Bob to
extend the game UI by keeping his personal cards and control UI on the
smartphone and displaying the poker table on the large display. Bob confirms and
waits for other players to join.

Alice is visiting Bob and decides to join the game.  She opens the same poker
site in the browser on her smartphone and selects the option "join game". The
browser shows a dialog with a list of running poker sessions. She selects the
session started by Bob and joins the game. The game starts immediately after two
players are joined. Now Alice and Bob can see their personal cards on their
smartphones and the large screen displays the poker table with shared cards,
current bets, and remaining money of each player.

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

### <a name="uc05"></a>UC05: Multiplayer gaming - Pictionary

Bob visits a Pictionary game [[PICTIONARYGAME]](#ref-PICTIONARYGAME) site on his
smartphone. He clicks the "Start on TV" button and selects his TV’s name from
the list of presentation displays that pops up on the phone's screen. The
Pictionary site opens on the TV screen.

Bob now waits for Ann and Joe to join the game from their smartphones by opening
the same site and connecting to the TV. After all the players have joined, Bob
presses the "start game" button on his smartphone and receives the first word to
draw: "blanket."

Bob draws a picture of a blanket on the touch screen of his smartphone. The
picture is mirrored on the TV screen as he draws. At the same time, Ann
and Joe are trying to guess what Bob is drawing by typing answers on their own
smartphones and sending them to the TV screen. The TV shows the answers coming
from all users and the game continues until Ann provides the correct answer.
Ann gets points for the correct answer.  The next round of the game starts with
Ann drawing a new word.

Joe then decides to exit the game by pressing the "exit game" button.  That
information is passed to the TV and Joe's name disappears from the list of the
players on the TV screen. Bob and Ann play one more round of the game with Ann
drawing and Bob guessing the correct word. After that round is over, they decide
to stop playing and both press the "exit game" button on their smartphones.  The
site on the TV is notified that all the players have left the game, and it
presents a list of the top players. No one decides to start a new game, and
after a period of time the the game on the TV exits itself.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ04](#req04), [REQ05](#req05), [REQ06](#req06), [REQ07](#req07), [REQ09](#req09)

### <a name="uc06"></a>UC06: Presenting to local and remote screens

Alice enters a conference room with two flat screen TVs.  She opens a slide
presentation site and initiates presentation of a deck of slides on the first
TV.  The presentation connects automatically to the second TV to show a video
accompanying her slides.

Alice wishes to present simultaneously to Bob, who at a remote site.  She
initiates a connection via the presentation site to Bob's conference room, which
causes the presentation running in Alice's room to start showing on the TVs in
Bob's room.  As Alice moves through the slides in her room, the content in Bob's
room remains in sync.

When Alice is done presenting, she stops presentation locally, which also
terminates presentation on Bob's TVs.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ04](#req04), [REQ05](#req05), [REQ06](#req06), [REQ07](#req08)

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
[receiving browsing context](https://w3c.github.io/presentation-api/#dfn-receiving-browsing-context)
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

### <a name="req09"></a>REQ09: Terminating presentation

A connected controller should be able to request termination of a presentation,
which closes the browsing context and disconnects all connected controllers.  In
addition, a presentation should be able to terminate itself.

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

## References

<a name="ref-PICTIONARYGAME">[PICTIONARYGAME]</a> https://en.wikipedia.org/wiki/Pictionary
