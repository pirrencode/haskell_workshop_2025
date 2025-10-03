module Domain.Picca where

-- Picca domain entity
data Size = Small | Medium | Large deriving (Show, Eq)
data Crust = Thin | Thick deriving (Show, Eq)
data Topping = Cheese | Pepperoni | Mushrooms | Olives | Ham | Pineapple deriving (Show, Eq)

data Picca = Picca
  { size :: Size
  , crust :: Crust
  , toppings :: [Topping]
  } deriving (Show, Eq)
