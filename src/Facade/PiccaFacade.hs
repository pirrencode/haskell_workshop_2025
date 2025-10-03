module Facade.PiccaFacade where

import Builder.PiccaBuilder
import Domain.Picca

-- Facade for Picca creation

data PiccaFacade = PiccaFacade
  { startBuilder :: PiccaBuilder
  , withSize :: Size -> PiccaBuilder -> PiccaBuilder
  , withCrust :: Crust -> PiccaBuilder -> PiccaBuilder
  , withTopping :: Topping -> PiccaBuilder -> PiccaBuilder
  , finish :: PiccaBuilder -> Maybe Picca
  }

piccaFacade :: PiccaFacade
piccaFacade = PiccaFacade
  { startBuilder = emptyBuilder
  , withSize = setSize
  , withCrust = setCrust
  , withTopping = addTopping
  , finish = buildPicca
  }
