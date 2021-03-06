\version "2.18.0"
\header {
	title = "Tsmindao Ghmerto"
	poet = "Lenjer (Svaneti)"
	composer = "Arranged by Islam Pilpani"
	arranger = "Transcribed by Patty Cuyler (1998) and Colin Kinlund (2012)"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 18)

\paper { 
	markup-system-spacing #'padding = #5
	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 20) 
         (minimum-distance . 15) 
         (padding . 1) 
        (stretchability . 60)) 
}
%}

%{ Lyrics
==============================================================================
%}

Refrain = \lyricmode
{
	Tsmin -- da -- i -- wo
}

VerseOne = \lyricmode
{
	ghme -- i -- er -- to -- i -- a
}

VerseTwo = \lyricmode
{
	dzli -- i -- e -- ro -- i -- a
}

VerseThree = \lyricmode
{
	u -- kuv -- da wo -- i -- a
}

VerseFour = \lyricmode
{
	Sheg -- vi -- tsqa -- i -- a -- len chven.
}

%{ Music
==============================================================================
%}

pirveli = \relative c''
{
	\clef "treble" \key a \minor
	\time 6/4
	\repeat volta 2
	{
		d2 e4. c8 d4 ( c)
		\time 10/4
		e4. e8 d4 ( c)
		e4. d8 c4 ( b a2)
	}
	\time 6/4
	d2 e4. c8 d4 ( c)
	\time 10/4
	f4 e d ( c)
	e4. d8 c4 ( b a2)
	\time 8/4
	d2 c d c
	\time 6/4
	d2 c b
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup { \small \italic "Repeat song 3 times" }
}

meori = \relative c''
{
	\clef "treble" \key a \minor
	\repeat volta 2
	{
		c2 c4. c8 c2
		c4. d8 c (b a4)
		b4. c8 b ( a g4 a8 b c4)
	}
	c2 c4. c8 c2
	c4 d c8 ( b a4)
	b4. c8 b ( a g4 a8 b c4)
	b2 a b a c4 ( b) a2 b
	\bar "|."
}

bani = \relative c''
{
	\clef "treble" \key a \minor
	\repeat volta 2
	{
		g2 g4. g8 g2
		g4. g8 g4 ( a)
		e4. e8 f4 ( g a f)
	}
	\break
	g2 g4. g8 g2
	g4 g g ( a)
	e4. e8 f4 ( g a f)
	\break
	g2 a e f g a b
}

\score {
\new ChoirStaff {
	<<

	\new Voice = "pirveliEkhma"
	{ \pirveli }
	\new Lyrics
	\lyricsto "pirveliEkhma"
	{
		<<
		{ \Refrain \VerseOne }
		\new Lyrics
			{
			\set associatedVoice = "pirveliEkhma"
			\skip 1 \VerseTwo
			}
		>>
		{ \Refrain \VerseThree \VerseFour }
	}
	
	\new Voice = "meoriEkhma"
	{ \meori }
	\new Lyrics	
	\lyricsto "meoriEkhma"
	{
		<<
		{ \Refrain \VerseOne }
		\new Lyrics
			{
			\set associatedVoice = "pirveliEkhma"
			{ \skip 1 \VerseTwo }
			}
		>>
		{ \Refrain \VerseThree \VerseFour }
	}
		
	\new Voice = "baniEkhma"
	{ \bani }
	\new Lyrics
	\lyricsto "baniEkhma"
	{
		<<
		{ \Refrain \VerseOne }
		\new Lyrics
			{
			\set associatedVoice = "pirveliEkhma"
			{ \skip 1 \VerseTwo }
			}
		>>
		{ \Refrain \VerseThree \VerseFour }
	}
		
	>>
}
\layout {
	ragged-right = ##f
	indent = 0.00 \cm
	firstpagenumber = no
	papersize = letter
    \context {
		\Staff
		\remove Time_signature_engraver
    }
	\context {
		\Lyrics
		\override LyricText.self-alignment-X = #LEFT
	}
}
}