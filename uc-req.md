# Use cases and requirements for Presentation API

This document captures the [use cases](#use-cases) and [requirements](#requirements) to consider in the specification of
the [W3C Presentation API][pres-api].

## Use Cases

This section collects relevant use cases for the [Presentation API][pres-api].

> each use case is defined in its own subsection. To define a new use case just copy/paste an existing one and
update the use case identifier (UCxx), title, dependencies, description and requirements.

### <a name="uc01"></a>UC01: Presentation
A user is preparing a set of slides for a talk. Using a web-based service, she is editing her slides and speaker notes
on the primary screen while the secondary larger screen shows a preview of the current slide. When the slides are done,
her mobile phone allows her to access them from an online service while on the go. Coming to the conference, using
wireless display technology, she would like to present her slides on the stage screen from her mobile phone.
The phone's touch screen helps her to navigate slides and presents a slide preview while the projector shows her slides
to the audience.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ04](#req04), [REQ05](#req05)

### <a name="uc02"></a>UC02: Video and image sharing

Using an online video or image sharing service, a user would like to show memorable moments to her friends. Using a
device with a small screen, however, a user cannot show the content to a large group of people. Connecting an external
TV screen or projector to her device - with a cable or wirelessly - the online sharing service now makes use of the
connected display, allowing a wider audience to enjoy the content. The web page shows UI elements that allow the user
to trigger displaying content on the secondary display (e.g., a "send to second screen" ) only if there is at least
one secondary screen available.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ04](#req04), [REQ05](#req05)

### <a name="uc03"></a>UC03: Multiplayer gaming - Poker

Bob enters an online poker site on his smartphone to play poker with friends. He selects the option "create new game"
to start a game session for two players. The poker site detects that there is display available and asks Bob to extend
the game UI by keeping his personal cards and control UI on the smartphone and displaying the poker table on the large
display. Bob confirms and waits for other players to join. Alice is visiting Bob and decides to join the game.
She opens the same poker site in the browser on her smartphone and selects the option "join game". The browser shows a
dialog with a list of running poker sessions. She selects the session started by Bob and joins the game. The game
starts immediately after two players are joined. Now Alice and Bob can see their personal cards on their smartphones
and the large screen displays the poker table with shared cards, current bets, and remaining money of each player.

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ03](#req03), [REQ04](#req04), [REQ05](#req05)

**Images**

* <a name="uc03-img1"></a>Poker Table

    ![Poker Table][uc03-img1]

* <a name="uc03-img2"></a>Poker Player: Alice

    ![Poker Client: Alice][uc03-img2]

* <a name="uc03-img3"></a>Poker Player: Bob

    ![Poker Client: Bob][uc03-img3]

### <a name="uc04"></a>UC04: Media flinging to multiple screens

Alice enters a video sharing site using a browser on her tablet. Next, Alice picks her favorite video from the site,
and the video starts to play on her tablet. While the video is playing Alice clicks a button "Share on different screen".
The browser provides a user interface that lists all the screens Alice has at her home, asking her to select one.
The screens are identified by names that are familiar to Alice. Alice picks one screen from the list, "Alice's big TV",
and the video playback continues seamlessly on the selected screen. Next she decides to switch the playback to a different
screen. She clicks the same button "Share on different screen" provided by the site, and the browser presents the user
interface that lists all the screens. Alice picks another screen from the list, "Alice's kitchen TV", and the playback
resumes on that screen. Video site also provides a feature to see the action (Alice is watching a soccer game)
from a different angle. Alice clicks a button "Select screen for additional angle", and the browser asks Alice similarly
 to select the screen for playback. Alice picks "Alice's Projector" and the soccer game is shown on the projector from
 a different angle, in parallel to the content being played back on "Alice's kitchen TV".

**Requirements**: [REQ01](#req01), [REQ02](#req02), [REQ04](#req04), [REQ05](#req05)

> ISSUE #40: Screen availability mechanism for multiple sessions

## Requirements

This section collects all requirements derived from the [use cases](#use-cases) listed in the previews section.

> each requirement is defined in its own subsection. To define a new requirement just copy/paste an existing one and
  update the identifier (REQxx), title and description.

### <a name="req01"></a>REQ01: Discovery & availability

The UA must provide a way to find out whether at least one secondary screen is available.

### <a name="req02"></a>REQ02: Launching presentation

The UA must provide a way to start sending content to the secondary screen. This may occur at the request of the page
or at the request of the UA.

### <a name="req03"></a>REQ03: Resuming presentation

The UA must be able to resume an existing session with the content being displayed on the secondary screen.

### <a name="req04"></a>REQ04: Communication

The UA must enable exchanging data between the primary and the secondary screen in order to have a control channel
between the primary and secondary page. The UA must not make assumptions about the execution locality of the UA of
the remote page it communicates with (i.e. the secondary page might run on a remote UA, and thus the link between
these two pages must be loosely coupled).

### <a name="req05"></a>REQ05: Signaling disconnection

The UA must signal disconnection from the presentation page to the primary page and vice versa.

[pres-api]: http://w3c.github.io/presentation-api/
[uc03-img1]: ./images/uc-multiplayer-game-poker-table.png
[uc03-img2]: ./images/uc-multiplayer-game-player-alice.png
[uc03-img3]: ./images/uc-multiplayer-game-player-bob.png
