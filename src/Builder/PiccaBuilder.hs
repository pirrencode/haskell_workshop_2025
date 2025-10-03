module Builder.PiccaBuilder where

import Domain.Picca

-- Builder for Picca

data PiccaBuilder = PiccaBuilder
  { bSize :: Maybe Size
  , bCrust :: Maybe Crust
  , bToppings :: [Topping]
  } deriving (Show)

emptyBuilder :: PiccaBuilder
emptyBuilder = PiccaBuilder Nothing Nothing []

setSize :: Size -> PiccaBuilder -> PiccaBuilder
setSize s b = b { bSize = Just s }

setCrust :: Crust -> PiccaBuilder -> PiccaBuilder
setCrust c b = b { bCrust = Just c }

addTopping :: Topping -> PiccaBuilder -> PiccaBuilder
addTopping t b = b { bToppings = t : bToppings b }

buildPicca :: PiccaBuilder -> Maybe Picca
buildPicca (PiccaBuilder (Just s) (Just c) ts) = Just $ Picca s c (reverse ts)
buildPicca _ = Nothing
