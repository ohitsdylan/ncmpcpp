# ncmpcpp
A fork of [lucas-mior's fork](https://github.com/lucas-mior/ncmpcpp-maintained) of [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) with some personal changes.

---

## Changes
- Removed last_fm stuff
- Restored clock feature

# NCurses Music Player Client (Plus Plus)

Project page - https://rybczak.net/ncmpcpp/

## ncmpcpp – featureful ncurses based MPD client inspired by ncmpc

### Main features:

* tag editor
* playlist editor
* easy to use search engine
* media library
* music visualizer
* new display mode
* alternative user interface
* ability to browse and add files from outside of MPD music directory
…and a lot more minor functions.

### Dependencies:

* boost library [https://www.boost.org/]
* ncurses library [http://www.gnu.org/software/ncurses/ncurses.html]
* readline library [https://tiswww.case.edu/php/chet/readline/rltop.html]
* curl library (optional, required for fetching lyrics and last.fm data) [https://curl.haxx.se/]
* fftw library (optional, required for frequency spectrum music visualization mode) [http://www.fftw.org/]
* tag library (optional, required for tag editing) [https://taglib.org/]

### Known issues:
* No full support for handling encodings other than UTF-8.

### Installation:

```
$ make
$ sudo make install
```
