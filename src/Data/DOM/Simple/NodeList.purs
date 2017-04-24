module Data.DOM.Simple.NodeList where

import Prelude (bind, map, pure, ($), (>>=), (>>>))

import DOM (DOM)
import DOM.Node.Types (NodeList)

import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe)
import Data.Array(range, catMaybes)
import Data.Traversable(sequence)

import Data.DOM.Simple.Unsafe.NodeList (unsafeNodeListItem, unsafeNodeListLength, unsafeNodeListToArray)
import Data.DOM.Simple.Unsafe.Utils(ensure)
import Data.DOM.Simple.Unsafe.Element (HTMLElement)

class NodeListInst b where
  length  :: forall eff. b -> (Eff (dom :: DOM | eff) Int)
  item    :: forall eff. Int -> b -> (Eff (dom :: DOM | eff) (Maybe HTMLElement))

instance nodeList :: NodeListInst NodeList where
  length = unsafeNodeListLength
  item idx el = (unsafeNodeListItem idx el) >>= (ensure >>> pure)

nodeListToArray :: forall eff. NodeList -> (Eff (dom :: DOM | eff) (Array HTMLElement))
nodeListToArray nl = do
  len <- length nl
  xs <- sequence (map (\i -> item i nl) $ range 0 len)
  pure $ catMaybes xs

nodeListToArray' :: forall eff. NodeList -> (Eff (dom :: DOM | eff) (Array HTMLElement))
nodeListToArray' = unsafeNodeListToArray
