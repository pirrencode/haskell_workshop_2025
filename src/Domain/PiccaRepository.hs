module Domain.PiccaRepository where

import Domain.Picca

class Monad m => PiccaRepository m where
  savePicca :: Picca -> m ()
  getPiccaById :: Int -> m (Maybe Picca)
