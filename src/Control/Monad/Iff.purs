module Control.Monad.Iff
( Iff
, launchIff
, forkIff
) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (class MonadEff)
import Prelude

-- | Asynchronous computation.
foreign import data Iff :: # ! -> * -> *

instance functorIff :: Functor (Iff eff) where
  map = _map

instance applyIff :: Apply (Iff eff) where
  apply = _apply

instance applicativeIff :: Applicative (Iff eff) where
  pure = _pure

instance bindIff :: Bind (Iff eff) where
  bind = _bind

instance monadIff :: Monad (Iff eff)

instance monadEffIff :: MonadEff eff (Iff eff) where
  liftEff = _liftEff

-- | Start an asynchronous computation but do not wait for it to finish.
launchIff :: forall eff. Iff eff Unit -> Eff eff Unit
launchIff = _launchIff

-- | Start an asynchronous computation but do not wait for it to finish.
forkIff :: forall eff. Iff eff Unit -> Iff eff Unit
forkIff = _forkIff

foreign import _map :: forall eff a b. (a -> b) -> Iff eff a -> Iff eff b
foreign import _apply :: forall eff a b. Iff eff (a -> b) -> Iff eff a -> Iff eff b
foreign import _pure :: forall eff a. a -> Iff eff a
foreign import _bind :: forall eff a b. Iff eff a -> (a -> Iff eff b) -> Iff eff b
foreign import _liftEff :: forall eff a. Eff eff a -> Iff eff a
foreign import _launchIff :: forall eff. Iff eff Unit -> Eff eff Unit
foreign import _forkIff :: forall eff. Iff eff Unit -> Iff eff Unit
