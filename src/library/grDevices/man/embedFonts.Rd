% File src/library/grDevices/man/embedFonts.Rd
% Part of the R package, https://www.R-project.org
% Copyright 1995-2015 R Core Team
% Distributed under GPL 2 or later

\name{embedFonts}
\alias{embedFonts}
\alias{embedGlyphs}
\concept{encoding}
\title{Embed Fonts in PostScript and PDF}
\description{
  Runs Ghostscript to process a PDF or PostScript file and
  embed all fonts in the file.

  Use \code{embedGlyphs()} if you have drawn typeset glyphs
  (see \code{\link{glyphInfo}}), which is only relevant for PDF files.
}
\usage{
embedFonts(file, format, outfile = file,
           fontpaths = character(), options = character())

embedGlyphs(file, glyphInfo, outfile = file, options = character())
}
\arguments{
  \item{file}{a character string giving the name of the original file.}
  \item{format}{the format for the new file (with fonts embedded) given as
    the name of a ghostscript output device.
    If not specified, it is guessed from the suffix of \code{file}.}
  \item{outfile}{the name of the new file (with fonts embedded).}
  \item{fontpaths}{a character vector giving directories that
    Ghostscript will search for fonts.}
  \item{options}{a character vector containing further options to
    Ghostscript.}
  \item{glyphInfo}{typeset glyph information produced by
    \code{glyphInfo()}, or a list of the same.}
}
\details{
  This function is not necessary if you just use the standard
  default fonts for PostScript and PDF output.

  If you use a special font, this function is useful for
  embedding that font in your PostScript or PDF document
  so that it can be shared with others without them having
  to install your special font (provided the font licence allows this).

  If the special font is not installed for Ghostscript,
  you will need to tell Ghostscript where the font is, using
  something like \code{options="-sFONTPATH=path/to/font"}.

  You will need \code{ghostscript}: the full path to the executable can
  be set by the environment variable \env{R_GSCMD}. If this is
  unset, a GhostScript executable will be looked for by name on your
  path: on a Unix alike \code{"gs"} is used, and on Windows the setting
  of the environment variable \env{GSC} is used, otherwise commands
  \code{"gswi64c.exe"} then \code{"gswin32c.exe"} are tried.

  The \code{format} is by default \code{"ps2write"}, when the original
  file has a \code{.ps} or \code{.eps} suffix, or \code{"pdfwrite"} when
  the original file has a \code{.pdf} suffix.  For versions of
  Ghostscript before 9.10, \code{format = "pswrite"} or \code{format =
  "epswrite"} can be used: as from 9.14 \code{format = "eps2write"} is
  also available.  If an invalid device is given, the error message will
  list the available devices.
  
  Note that Ghostscript may do font substitution, so the font embedded
  may differ from that specified in the original file.

  Some other options which can be useful (see your Ghostscript
  documentation) are \option{-dMaxSubsetPct=100},
  \option{-dSubsetFonts=true} and  \option{-dEmbedAllFonts=true}.

  \code{embedGlyphs()} is recommended for \code{pdf()} files
  that contain typeset glyphs (see \code{\link{glyphInfo}}),
  but it will only work for TrueType fonts.
}
\value{
  The shell command used to invoke Ghostscript is returned
  invisibly. This may be useful for debugging purposes as
  you can run the command by hand in a shell to look for problems.
}
\seealso{
  \code{\link{postscriptFonts}},
  \code{\link{Devices}}.

  Paul Murrell and Brian Ripley (2006).
  \dQuote{Non-standard fonts in PostScript and PDF graphics.}
  \emph{R News}, \bold{6}(2), 41--47.
  \url{https://www.r-project.org/doc/Rnews/Rnews_2006-2.pdf}.
}
\keyword{device}
