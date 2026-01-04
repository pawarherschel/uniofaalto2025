#import "@preview/wordometer:0.1.5": word-count

/*
= Introduction video

Each applicant should submit a short video (max 2 minutes) where they tell about themselves, their background, interests, and portfolio highlights in English. Please start with a brief (max 20s) shot where you introduce yourself, speaking to the camera. After that, please include and explain content such as gameplay clips of games that you have made or other relevant content that showcases your skills. Please note that in addition to your best game projects, we are interested in all forms of creativity, so you can also show other forms of art or creative work. For each project shown on the video, please clearly state or add subtitles that state the year and your role or contribution such as programming, art or design.

Note that you can film yourself using a smartphone camera—we do not expect the applicants to have professional video production equipment. For editing the video, there are free software tools such as DaVinci Resolve.

The video should be submitted as a link in a pdf file named “Introduction_Video.pdf”. The link can be to an unlisted or private YouTube video, for instance. If the video is password-protected, the password must be included in the PDF. Please make sure that the link is clickable or can be easily copied from the PDF.

The video will be only viewed by the evaluators. However, if you are selected, we will ask for your permission to share the video with other selected students.
*/

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

#let next-slide(title, content) = page(height: auto)[
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

#pagebreak(weak: true)

OUTLINE:

#outline()

text written like #slow-down-hint[this] is hard for me to speak fast

and needs to be spoken slower

script target (in seconds): #script-target (#format-time(script-target))


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
  My name is Herschel Pravin Pawar,

  I also go by Kat.

  This video was recorded as part of my

  Aalto application.
]
#next-slide[Parrylord (Bevy)][
  Last year I set out to learn Bevy,

  an ECS-based game engine

  written in Rust.
]
#next-slide[Theme][
  I wanted to encourage the player to take risks.

  So,

  the player’s damage,

  projectiles,

  and score

  increase with

  the number of projectiles

  parried at once.
]
#next-slide[Solo Developer][
  After learning the basics,

  I participated in Bevy Jam 6.

  I also made an online leaderboard for the game.
]
#next-slide[Result][
  I placed

  sixtyth

  out of

  ninety-eight.
]
#next-slide[Your Own Size (Godot)][
  This year

  I got an itch

  to do pixel art again

  and participated as a pixel artist

  for the GameDev.tv Game Jam 2025.
]
#next-slide[Theme][
  We incorporated

  the theme

  through aesthetics

  and story.
]
#next-slide[Artist][
  The art team

  had one more person.

  My teammate

  was more

  experienced

  and faster

  than me.
]
#next-slide[Showcase][
  My biggest contribution was a

  three-by-three

  minimal

  autotile

  tileset.
]
#next-slide[The problem][
  Cosmical One,

  my teammate,

  drew beautiful backgrounds,

  but they made it hard

  to see the platforms

  and enemies.
]
#next-slide[Solution][
  I wanted players

  to appreciate the backgrounds

  without losing the gameplay.

  So,

  I finally got

  to make a shader.
]
#next-slide[Result][
  We placed

  twenty-fourth

  out of

  one thousand and ten.
]
#next-slide[Coventry University Summer School][
  Until last year,

  I was unsure about game dev.

  I didn’t know any game devs IRL,

  so when one of my friends

  told me about a summer school program,

  I took the

  opportunity.
]
#next-slide[Result][
  I met a lot of people there,

  talked to a lot of people,

  especially from the games industry,

  and concluded that

  I do want to pursue game dev.
]
#next-slide[Fractured Elements (Unity)][
  The finale for the

  summer school was

  a game jam.
]
#next-slide[Theme][
  We incorporated

  the theme

  into the lore,

  which was reflected in the game

  as a mechanic.
]
#next-slide[Lead Developer][
  My partner had been programming for less time than me,

  but he plays

  Dungeons & Dragons

  and acts as the dungeon master,

  so he was better at

  lore building,

  game mechanics,

  and other aspects.
]
#next-slide[Result][
  We placed

  second

  out of

  four.
]
#next-slide[Cosmos Conquerors (Godot)][
  This was also the first game

  I made with Godot

  that was not just

  a proof of concept.
]
#next-slide[Theme][
  And it made me realize

  that I enjoy game dev

  even if I’m bad at ideas.
]
#next-slide[Solo Developer][
  I enjoy the process of making games.
]
#next-slide[Result][
  I placed

  four thousand

  six hundred

  fifty second

  out of

  six thousand seven hundred third.
]
#next-slide[Krita Palette Creator (Rust)][
  I tend to

  write program

  for problems I have.

  So when I wanted

  to extract a color palette

  from an image.

  The existing tools were annoying,

  I made the tool myself.
]
#next-slide[Rosetta Code][
  I first checked Rosetta Code,

  but they didn’t have the median-cut algorithm,

  so I contributed

  the rust code.
]
#next-slide[Acknowledgement][
  I know I stand

  on the shoulders of

  giants.
]
#next-slide[Heavily Inspired by][
  This video would

  not have

  been

  possible

  without generations of

  people who came

  before me.
]
#next-slide[Important Links][
  There are so many people

  who influenced me,

  but I don’t remember.

  I hope

  one day someone will look

  at my work and be influenced.
]

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
