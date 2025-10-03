import Control.Concurrent (threadDelay)
import System.IO
import qualified Data.Map as Map

pizzaPrices :: Map.Map String Double
pizzaPrices = Map.fromList
    [ ("Margherita", 8.5)
    , ("Hawaiian", 10.0)
    , ("Pepperoni", 9.5)
    , ("Vegetarian", 9.0)
    ]

main :: IO ()
main = do
    putStrLn "Enter the type of pizza:"
    pizzaType <- getLine
    putStrLn "coocking pizza..."
    progress 50
    putStrLn (createPizza pizzaType)
    case Map.lookup pizzaType pizzaPrices of
        Just price -> putStrLn $ "Price: $" ++ show price
        Nothing    -> putStrLn "Sorry, price not found for this pizza."
    

progress :: Int -> IO ()
progress n = do
    hSetBuffering stdout NoBuffering
    mapM_ (\i -> do
        putStr $ "\r[" ++ replicate i '#' ++ replicate (n-i) '-' ++ "]"
        threadDelay 50000) [0..n]
    putStrLn ""

createPizza :: String -> String
createPizza pizzaType = "Pizza is ready to be served: " ++ pizzaType
-- Example usage:
-- createPizza "Margherita"  -- returns "Pizza is ready to be served: Margherita"