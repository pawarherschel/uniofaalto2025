#import "@preview/wordometer:0.1.5": word-count

= Introduction video

Each applicant should submit a short video (max 2 minutes) where they tell about themselves, their background, interests, and portfolio highlights in English. Please start with a brief (max 20s) shot where you introduce yourself, speaking to the camera. After that, please include and explain content such as gameplay clips of games that you have made or other relevant content that showcases your skills. Please note that in addition to your best game projects, we are interested in all forms of creativity, so you can also show other forms of art or creative work. For each project shown on the video, please clearly state or add subtitles that state the year and your role or contribution such as programming, art or design.

Note that you can film yourself using a smartphone camera—we do not expect the applicants to have professional video production equipment. For editing the video, there are free software tools such as DaVinci Resolve.

The video should be submitted as a link in a pdf file named “Introduction_Video.pdf”. The link can be to an unlisted or private YouTube video, for instance. If the video is password-protected, the password must be included in the PDF. Please make sure that the link is clickable or can be easily copied from the PDF.

The video will be only viewed by the evaluators. However, if you are selected, we will ask for your permission to share the video with other selected students.

#let slide = counter("slide")
#let time-elapsed = state("time-elapsed", 0)

#let script-target = 110
#let fps = 25

#let TODO(content) = box(fill: red, content)

#let double-digit(number) = if str(number).len() >= 2 {
  number
} else {
  [0#number]
}

#let double-digit-trunc(number) = if str(calc.trunc(number)).len() >= 2 {
  calc.trunc(number)
} else {
  [0#calc.trunc(number)]
}

#let format-time(seconds) = if seconds < 60 {
  [00:#double-digit-trunc(seconds)]
} else {
  let minutes = calc.trunc(seconds / 60)
  let seconds = calc.rem(seconds, 60)
  [#double-digit-trunc(minutes):#double-digit-trunc(seconds)]
}

#let time-to-frames(seconds) = calc.floor(
  (seconds / script-target) * (fps * script-target),
)

#let plain-text(it) = {
  return if type(it) == str {
    it
  } else if it == [ ] {
    " "
  } else if it.has("children") {
    it.children.map(plain-text).join()
  } else if it.has("body") {
    plain-text(it.body)
  } else if it.has("text") {
    if type(it.text) == str {
      it.text
    } else {
      plain-text(it.text)
    }
  } else {
    panic(it)
  }
}

#let next-slide(title, content) = page[
  #word-count(total => [
    #let budget = (total.words - 11) / (150 /*wpm*/ / 60)
    #rect(width: 100%, inset: 1em)[
      #align(horizon + center)[
        #block[
          / slide: #context slide.display() | #box(width: 1fr, {
              show heading: it => plain-text(it.body).codepoints().join()
              [= #title]
            })

          #let time = context {
            format-time(time-elapsed.get())
          }

          #let time-left = context {
            format-time(script-target - time-elapsed.get())
          }

          #let start-frame = context {
            time-to-frames(time-elapsed.get())
          }

          #let frames-budget = time-to-frames(budget)

          #align(left)[
            Budget: #double-digit(budget)\s#linebreak()
            Time Elapsed: #time#linebreak()
            Time Left: #time-left#linebreak()
            Start Frame: #start-frame#linebreak()
            Frames Budget: #frames-budget
          ]

          #time-elapsed.update(x => x + budget)
        ]
      ]
    ]<no-wc>
    #slide.step()

    #content
  ])
]

#let slow-down-hint(content) = [

  ---\/ #highlight[#content] \/---

]

#let breath = [
  |#box(width: 1fr)[
    #repeat[---]
  ]
  BREATH
  #box(width: 1fr)[
    #repeat[---]
  ]|
]

#pagebreak()

OUTLINE:

#outline()

text written like #slow-down-hint[this] is hard for me to speak fast

and needs to be spoken slower

script target (in seconds): #script-target (#format-time(script-target))

#set page(margin: (left: 15em, right: 15em), height: auto)

#next-slide[Title Slide][
  I'm going to talk fast,

  so you might need to pause

  and

  read the slides.

  #breath
]

#next-slide[Self Introduction][
  Heya,
]

#next-slide[Who am I?][
  my name is Herschel Pravin Pawar,

  I also go by kat in some circles.

  This video has been recorded as part of my

  Aalto application.

  #breath
]



#next-slide[Bevy: Rust][
  Last year I set out to learn Bevy.

  An ECS based game engine.
]
#next-slide[Parrylord: Solo Developer][
  After learning the basics,

  I decided to participate in Bevy Jam 6.

  The theme was "Chain Reaction".

  I also made an online leaderboard for the game.

  #TODO[slogan: Turn the tides, convert the usual bullet hell experience into bullet heaven by parrying the enemies' projectiles!]
]
#next-slide[Parrylord: Theme][
  The main mechanic is

  parrying.

  I wanted to encourage the player to take risks.

  So,

  the player damage,

  projectiles,

  and score

  increases with

  the number of projectiles

  parried at once.
]
#next-slide[Parrylord: Result][
  #TODO[SHOW SCOREBOARD HERE]

  I placed

  sixty first

  out of

  ninety eight.
]

#next-slide[Godot][
  A few years prior

  I learnt Godot for game dev

  and made quite a few

  proof of concepts

  to learn individual elements

  for programming.
]
#next-slide[Your Own Size: Artist (+ Tech Artist + Coordinator)][
  This year

  I got an itch

  to do pixel art again.

  And participated as pixel artist for GameDev.tv Game Jam 2025.

  The theme was "Tiny Worlds".
]
#next-slide[Your Own Size: Theme][

  #TODO[explain how i implemented the theme]
]
#next-slide[Your Own Size: Showcase][
  I was the secondary pixel artist,

  as I had less experience compared to my teammate

  Cosmical One

  and consequently, I was slower.

  His artwork was really good,

  But we had a problem.
]
#next-slide[Your Own Size: The problem][
  He drew a really beautiful background.

  Which made it difficult to see

  the platforms and enemies.
]
#next-slide[Your Own Size: Solution][
  I made a shader

  which blurs the background

  if you don't move.

  And made sure it gradually blurs and unblurs,

  just in case someone has problems with flashing lights.
]
#next-slide[Your Own Size: Result][
  We placed

  seventy eighth

  out of

  one thousand and ten.
]

#next-slide[Coventry University Summer School][
  Until last year

  I was umming and arring about game dev.

  I didn't have any exposure to game dev irl

  but one of my friends'

  told me about a summer school program,

  and I participated in it.
]
#next-slide[Fractured Elements: Lead Developer][
  The theme was "Continous Change" and "2D Platformer"

  My partner had been programming for less than me.

  But he plays

  dungeons and dragons

  and acts as the dungeon master.

  So he was way better at

  lore building,

  game mechanics,

  and other aspects.
]
#next-slide[Fractured Elements: Theme][
  The player's elemental powers are unstable.

  They keep switching between elemental forms.

  To gain mastery over the elements,

  you need to defeat the guardians.
]
#next-slide[Fractured Elements: Result][
  We placed

  second

  out of

  four.
]
#next-slide[Coventry University Summer School: Result][
  I met a lot of people there

  talked to a lot of people

  especially from games industry

  and concluded that

  I do want to pursue game dev.
]

#next-slide[Cosmos Conquerors: Solo Developer][
  GMTK Game Jam 2023

  was my first game jam experience.

  This was also the first game

  I made with Godot

  which was not just

  a proof of concept.

  #TODO[slogan It's time to turn the tables and show those heroes who's boss!]
]
#next-slide[Cosmos Conquerors: Theme][
  In SHMUPs,

  you fight against hoards of enemies.

  Now,

  you're a hoard of enemies

  fighting against

  endless and

  evermore powerful enemies.
]
#next-slide[Cosmos Conquerors: Result][
  I placed

  four thousand six hundread and twelfth

  out of

  six thousand seven hundread and third.
]

#next-slide[Krita Palette Creator / Rosetta Code][
  A while back

  I had a problem

  where I wanted to quantize colors in an image.

  I had done it more like four times

  and tinkering with Krita was annoying.

  So I made a small tool

  which extracts the dominant colors

  from an image.
]

#next-slide[Why Aalto?][
  #TODO[TODO]

  Everything I read on the page,

  I went

  "you don't need to sell me more on it".
]

#next-slide[Acknowledgement][#TODO[TODO]]

/*

#next-slide(budget: 2.5)[Coventry University Summer School Game Jam]<slides>

I participated in the

#slow-down-hint[Summer School] for #slow-down-hint[Game Development].

#next-slide(budget: 2)[Result]<slides>

We wrapped up with a game jam,

and these are the results.

#next-slide(budget: 2)[Themes]<slides>

The themes were #slow-down-hint[Continuous Change] and #slow-down-hint[2D Platformer].

#breath

#next-slide(budget: 3.5)[The Team]<slides>

We created #slow-down-hint[Fractured Elements],

featuring a player with cycling #slow-down-hint[elemental] powers

#next-slide(budget: 4)[Main Mechanic]<slides>

I focused on making the gameplay

while my partner focused on

the creative aspects of the game.

#breath

#next-slide(budget: 6)[Player Architecture]<slides>

the player code I wrote

was reused for the final boss

and the high-level code was #slow-down-hint[generic] over #slow-down-hint[weapons]

and

#slow-down-hint[elemental powers].

#breath

#next-slide(budget: 2.5)[#[Game Maker ToolKit's 2023 Game Jam]]<slides>

I taught myself Godot

and

participated in a game jam.

#next-slide(budget: 3)[Result]<slides>

These were the results.

There were over #slow-down-hint[six thousand seven hundred] submissions.

#next-slide(budget: 1.5)[Theme]<slides>

The theme was #slow-down-hint[Roles Reversed].

#breath

#next-slide(budget: 3.5)[Gameplay]<slides>

In the game,

players control aliens

fighting to survive

against heros.

#next-slide(budget: 6.5)[Main Mechanic]<slides>

A random alien fires

while space bar is pressed

requiring the player

to choose between

having #slow-down-hint[predictability]

or

having more health.

#breath

#next-slide(budget: 4)[Bevy]<slides>

Recently,

I've been learning Bevy,

a #slow-down-hint[Rust-based] #slow-down-hint[ECS] #slow-down-hint[game engine].

#next-slide(budget: 4.5)[EMPTY SLIDE]<slides>

So far,

I've remade pong.

I'm using the project to learn

how to make online #slow-down-hint[multiplayer] games.

#breath

#next-slide(budget: 1.5)[Other Projects]<slides>

Some other projects include:

#next-slide(budget: 5.5)[VRCX Insights]<slides>

VRCX Insights

A #slow-down-hint[data mining] tool to extract friend circles

by corelating

people who are in the same room.

#next-slide(budget: 2)[Output Metadata]<slides>

You can see

why I had to zoom out the image so much.

#breath

#next-slide(budget: 4.5)[Booth Archiver]<slides>

Another project is Booth Archiver,

which compiles your Booth wish list

into a spreadsheet.

#next-slide(budget: 4)[Krita/GIMP Palette Generator]<slides>

I also created a tool

which quantizes given image

and

generates a palette from it.

#next-slide(budget: 3)[Rosettacode]<slides>

I also contributed

the code I wrote

to Rosettacode.

#breath

#next-slide(budget: 2.5)[Kait]<slides>

The textures for my OC

were made using Photoshop.

#next-slide(budget: 2)[Other Creative Stuff]<slides>

Here are some of the artworks I've made

#next-slide(budget: 2)[Goals for 2025]<slides>

These are some of my goals

for

2025

#next-slide(budget: 3)[Goal --- Short Description --- Why?]<slides>

the most important being

#slow-down-hint[WGPU] and #slow-down-hint[public speaking]

#breath

#next-slide(budget: 4.5)[Why Aalto]<slides>

I'm active in #slow-down-hint[Rust]

and

#slow-down-hint[queer meetups],

always striving to create a #slow-down-hint[welcoming atmosphere]

and

support others.

#breath

#next-slide(budget: 7.5)[Acknowledgement]<slides>

This #slow-down-hint[collaborative] spirit is something I value deeply

and

is one of the main reasons that the #slow-down-hint[multidisciplinary],

project-based approach at Aalto resonates with me.

#breath

#next-slide(budget: 3.5)[Heavily Inspired by]<slides>

I believe that innovation #slow-down-hint[thrives] when people from #slow-down-hint[diverse backgrounds] come together,

#next-slide(budget: 6.5)[End Slide]<slides>

and Aalto's #slow-down-hint[environment] provides

the perfect space

to exchange ideas

and grow,

both technically

and personally.

#next-slide(budget: 2.5)[Ending Note]<slides>

To close,

I'd like to share something

I saw on Tumblr

#next-slide(budget: 2)[Tumblr Post]<slides>

Its a post by

#slow-down-hint[viridian masquerade]

#next-slide(budget: 1.5)[THE Line]<slides>

This resonated very deeply with me

#next-slide(budget: 5)[EMPTY SLIDE]<slides>

If I was more creative,

I'd adapt it to

learning

and

growth

but I'm not

the best I can come up with is

#next-slide(budget: 2)[My heart]<slides>

#breath

...

...

...

Thank you.

#next-slide(budget: 0)[THE END]<slides>

*/

#pagebreak(weak: true)

#block[
  #align(center)[
    #text(size: 3em)[
      #box(width: 1fr)[#repeat([-])]
      Target time: #context format-time(script-target)
      #box(width: 1fr)[#repeat([-])]

      #box(width: 1fr)[#repeat([-])]

      #box(width: 1fr)[#repeat([-])]
      Total time: #context format-time(time-elapsed.get())
      #box(width: 1fr)[#repeat([-])]
    ]
  ]
]
