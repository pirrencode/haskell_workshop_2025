module Main where


import Builder.PiccaBuilder
import Domain.Picca
import Facade.PiccaFacade
import Test.HUnit

builderTest :: Test
builderTest = TestCase $ do
  let builder = setSize Medium . setCrust Thick . addTopping Cheese . addTopping Ham $ emptyBuilder
      picca = buildPicca builder
  assertEqual "Builder should create correct Picca" (Just (Picca Medium Thick [Ham, Cheese])) picca

facadeTest :: Test
facadeTest = TestCase $ do
  let facade = piccaFacade
      builder = withSize facade Small $ withCrust facade Thin $ withTopping facade Olives $ startBuilder facade
      picca = finish facade builder
  assertEqual "Facade should create correct Picca" (Just (Picca Small Thin [Olives])) picca

main :: IO Counts
main = runTestTT $ TestList [builderTest, facadeTest]
