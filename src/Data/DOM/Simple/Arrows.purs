-- I'm not sure this is a good idea, just an experiment..

module Data.DOM.Simple.Arrows where

import Control.Monad.Eff

import Data.Tuple
import Data.DOM.Simple.Types
import Data.DOM.Simple.Element
import Data.DOM.Simple.Document

class DOMArrows b where
  (#<-) :: forall eff. b -> (Tuple String String) -> (Eff (dom :: DOM | eff) Unit)
  (#->) :: forall eff. b -> String -> (Eff (dom :: DOM | eff) String)

  (?->) :: forall eff. b -> String -> (Eff (dom :: DOM | eff) HTMLElement)

  (%<-) :: forall eff. b -> String -> (Eff (dom :: DOM | eff) Unit)
  (@<-) :: forall eff. b -> String -> (Eff (dom :: DOM | eff) Unit)

class DOMArrowsEff b where
  (#<=) :: forall eff. (Eff (dom :: DOM | eff) b) -> (Tuple String String) -> (Eff (dom :: DOM | eff) Unit)
  (#=>) :: forall eff. (Eff (dom :: DOM | eff) b) -> String -> (Eff (dom :: DOM | eff) String)

  (?=>) :: forall eff. (Eff (dom :: DOM | eff) b) -> String -> (Eff (dom :: DOM | eff) HTMLElement)

  (%<=) :: forall eff. (Eff (dom :: DOM | eff) b) -> String -> (Eff (dom :: DOM | eff) Unit)
  (@<=) :: forall eff. (Eff (dom :: DOM | eff) b) -> String -> (Eff (dom :: DOM | eff) Unit)

instance arrowsHTMLElement :: (Element a) => DOMArrows a where
  (#<-) el val = setAttribute (fst val) (snd val) el
  (#->) el key = getAttribute key el

  (?->) el sel = querySelector sel el

  (%<-) el txt = setInnerHTML txt el
  (@<-) el txt = setTextContent txt el

instance arrowsEffHTMLElement :: (Element a) => DOMArrowsEff a where
  (#<=) el val = el >>= setAttribute (fst val) (snd val)
  (#=>) el key = el >>= getAttribute key

  (?=>) el sel = el >>= querySelector sel

  (%<=) el txt = el >>= setInnerHTML txt
  (@<=) el txt = el >>= setTextContent txt
