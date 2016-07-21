module Test.Main where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Iff
import Prelude

main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = launchIff do
  x <- map (_ + 1) (pure 1)
  liftEff $ log ("map works if 2 = " <> show x)

  x <- apply (pure (_ + 1)) (pure 1)
  liftEff $ log ("apply works if 2 = " <> show x)

  liftEff $ log "pure works"

  liftEff $ log "bind works"

  liftEff $ log "liftEff works"

  makeIff \k -> k unit
  liftEff $ log "makeIff works"

  liftEff $ log "launchIff works"

  forkIff do
    liftEff $ log "forkIff works (2/2)"
  liftEff $ log "forkIff works (1/2)"
