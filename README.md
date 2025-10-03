# Picca Project

A professional Haskell project for pizza (picca) creation using Clean Architecture, Facade, Builder, and file-based logging.

## Build

```
cabal build
```

## Run

```
cabal run picca
```

## Test

```
cabal test
```

## Lint & Format

```
hlint src app test
ormolu -i $(find src app test -name '*.hs')
```

## Docker

Build and run in Docker:

```
docker build -t picca .
docker run --rm picca
```

## Logging

Logs are written to `picca.log` in the project root. Log level and path can be configured in future releases.
# HaskellTest