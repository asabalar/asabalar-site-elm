watch:
  watchexec -w src just make
make:
  elm make src/Main.elm --output elm.js
