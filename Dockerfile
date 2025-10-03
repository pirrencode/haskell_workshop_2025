# syntax=docker/dockerfile:1
FROM haskell:9.4
WORKDIR /app
COPY . .
RUN cabal update && cabal build
CMD ["cabal", "run", "picca"]
