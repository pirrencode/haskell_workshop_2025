module Main where

import Facade.PiccaFacade
import Domain.Picca
import Logger.PiccaLogger

main :: IO ()
main = do
  let facade = piccaFacade
      builder1 = withSize facade Large $ startBuilder facade
      builder2 = withCrust facade Thin builder1
      builder3 = withTopping facade Cheese builder2
      builder4 = withTopping facade Pepperoni builder3
      maybePicca = finish facade builder4
  case maybePicca of
    Just picca -> logPiccaReady picca
    Nothing -> logMsg Error "Failed to create picca (missing fields)"
