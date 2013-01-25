\version "2.16.1"
\header {
	title = "Aralo"
	poet = "Trad. Georgian"
	composer = "Transcribed by Colin Kinlund,"
	arranger = "as sung by Village Harmony, 1998"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 16)
\paper { 
	markup-system-spacing #'padding = #6
	top-margin = 8
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 12) 
         (minimum-distance . 8) 
         (padding . 1) 
        (stretchability . 60)) 
 }

global = {
	\key c \major
	\time 2/4
}

refrainLyrics = \lyricmode
{
	a -- ra -- lo, o -- ru -- de -- la
	de -- li -- av -- ra -- ni -- na -- ni -- na
}

pirveliLyricsIntro = \lyricmode
{
	A -- ra -- lo, o -- ru -- di -- lo de -- la,
	a -- ba -- de -- li -- a, o -- ru -- de -- la
	{ \refrainLyrics }
}

meoriLyricsIntro = \lyricmode
{
	o -- ru -- di -- lo de -- la,
	a -- ba -- de -- li -- a, o -- ru -- de -- la
	{ \refrainLyrics }
}

baniLyricsIntro = \lyricmode
{
	a -- ba -- de -- li -- a, o -- ru -- de -- la
	{ \refrainLyrics }
}

baniLyricsVerse = \lyricmode
{
	Wo -- hi -- hey -- a
	wo -- hi -- hey -- a -- hey -- a
	{ \refrainLyrics }
}

baniAltOne = \lyricmode
{
	Wa __ wa -- ha -- he -- a
	{ \refrainLyrics }
}

stanzaOneLyrics = \lyricmode
{
	\set stanza = #"1." 
	Che  -- mom -- ts’ve -- lo che -- mom -- k’vle -- lo
	che -- mo akh -- los me -- zo -- be -- lo
	{ \refrainLyrics }
}

stanzaTwoLyrics = \lyricmode
{
	\set stanza = #"2." 
	Shen rom tses -- khli mo -- mi -- ki -- de,
	mit -- kha -- ro -- na ga -- na -- he -- na
	{ \refrainLyrics }
}

stanzaThreeLyrics = \lyricmode
{
	\set stanza = #"3." 
	Ka -- lo she -- ni tet -- ri ka -- va
	kals -- mi kon -- dem dzi -- na -- re -- so
	{ \refrainLyrics }
}

pirveliRefrain = \relative c''
{
	d8 d d4 e8. d16 c8 b
	c16 b a8 b8. b16 c8. c16 c4
}

pirveliIntro = \relative c''
{
	\clef "treble"
	c8 d e4 e16 e e e d8 c
	b16 c d e d4 e8. d16 c8 b
	{ \pirveliRefrain }
}

pirveliVerse = \relative c''
{
	\clef "treble"
	\repeat volta 2
	{
		e8 e e e e e e e
		f8 e d c b c d b
		{ \pirveliRefrain }
	}
}

meoriVerse = \relative c''
{
	c8 c c c c c c c
	d8 c b a g a b g
	f8 g a( b) c8. b16 a8 g
	a16 g f8 g8. g16 a8. a16 a4
}

meoriRefrain = \relative c''
{
	c8. b16 a8 g a16 g f8 g8. g16 a8. a16 a4
}
	
meoriIntro = \relative c''
{
	\clef "treble"
	r2 c16 c c c b8 a
	g16 a b c b4 c8. b16 a8 g
	b8 b b4
	{ \meoriRefrain }
}

baniIntro = \relative c''
{
	\clef "treble"
	r2 r2
	g16 g g g g4 a8. g16 f8 e
	g8 g g4 a8. g16 f8 e
	f16 e d8 e8. e16 f8. f16 f4 
}

baniRefrain = \relative c'
{
	\clef "treble"
	d8 d d4 d8. d16 e8 c
	d16 d d8 e8. e16 f8. f16 f4
}

baniVerse = \relative c'
{
	\clef "treble"
	c2 ( c8) e g e
	c8 d e f g4. e8
	{ \baniRefrain }
}

baniVerseAltOne = \relative c'
{
	\clef "treble"
	g'1 ~
	g2 g8 a b g
	{ \baniRefrain }
}

\score {
\new ChoirStaff \with { \global \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10 }

	<< 
	\new Voice = "pirveli"
	{ \pirveliIntro \break \pirveliVerse \pirveliVerse \pirveliVerse }
	\new Lyrics
	\lyricsto "pirveli"
	{ \pirveliLyricsIntro \stanzaOneLyrics \stanzaTwoLyrics \stanzaThreeLyrics }
	
	\new Voice = "meori"
	{ \meoriIntro \meoriVerse \meoriVerse \meoriVerse }
	\new Lyrics
	\lyricsto "meori"
	{ \meoriLyricsIntro \stanzaOneLyrics \stanzaTwoLyrics \stanzaThreeLyrics }

	\new Voice = "bani"
	{ \baniIntro \baniVerse \baniVerseAltOne \baniVerse }
	\new Lyrics
	\lyricsto "bani"
	{ \baniLyricsIntro \baniLyricsVerse \baniAltOne \baniLyricsVerse }
	>>
\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%     \remove Bar_engraver
%      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}
% \midi { \tempo 4=115 }
}