-- NOT FINISHED BUT AT LEAST I REQUESTED A PULL

-- Pizzeria Mamma Mia
createPizza :: String -> Int -> [String] -> String
createPizza pizza_type size ingredients = pizza_type ++ " Pizza"

main :: IO ()
main = do
    let pizza = createPizza "Hot"
    putStrLn (pizza)