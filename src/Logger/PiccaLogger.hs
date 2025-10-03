module Logger.PiccaLogger where

import Domain.Picca
import Data.Time.Clock
import Data.Time.Format (defaultTimeLocale, formatTime)
import System.IO

-- File path for log storage
logFilePath :: FilePath
logFilePath = "picca.log"

data LogLevel = Info | Warn | Error deriving (Show, Eq)

logMsg :: LogLevel -> String -> IO ()
logMsg level msg = do
  now <- getCurrentTime
  let logLine = "[" ++ formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" now ++ "] [" ++ show level ++ "] " ++ msg ++ "\n"
  appendFile logFilePath logLine

logPiccaReady :: Picca -> IO ()
logPiccaReady picca =
  logMsg Info $ "Pizza is ready to be served: " ++ show picca
