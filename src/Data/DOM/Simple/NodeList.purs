module Data.DOM.Simple.NodeList where

import Prelude

import DOM
import Control.Monad.Eff
import Data.Maybe
import Data.Array(range, catMaybes)
import Data.Traversable(sequence)

import Data.DOM.Simple.Unsafe.NodeList
import Data.DOM.Simple.Types
import Data.DOM.Simple.Unsafe.Utils(ensure)

class NodeListInst b where
  length  :: forall eff. b -> (Eff (dom :: DOM | eff) Int)
  item    :: forall eff. Int -> b -> (Eff (dom :: DOM | eff) (Maybe HTMLElement))

instance nodeList :: NodeListInst NodeList where
  length = unsafeNodeListLength
  item idx el = (unsafeNodeListItem idx el) >>= (ensure >>> return)

nodeListToArray :: forall eff. NodeList -> (Eff (dom :: DOM | eff) (Array HTMLElement))
nodeListToArray nl = do
  len <- length nl
  xs <- sequence (map (\i -> item i nl) $ range 0 len)
  return $ catMaybes xs

nodeListToArray' :: forall eff. NodeList -> (Eff (dom :: DOM | eff) (Array HTMLElement))
nodeListToArray' = unsafeNodeListToArray
