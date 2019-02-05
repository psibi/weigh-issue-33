{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import Control.DeepSeq
import GHC.Generics
import Weigh

data HasInt =
  HasInt !Int
  deriving (Generic)

instance NFData HasInt

data HasPacked =
  HasPacked HasInt
  deriving (Generic)

instance NFData HasPacked

data HasUnpacked =
  HasUnpacked {-# UNPACK #-}!HasInt
  deriving (Generic)

instance NFData HasUnpacked

packing :: Weigh ()
packing = do
  func "\\x -> HasInt x" (\x -> HasInt x) 5
  func "\\x -> HasPacked (HasInt x)" (\x -> HasPacked (HasInt x)) 5
  func "\\x -> HasUnpacked (HasInt x)" (\x -> HasUnpacked (HasInt x)) 5

main :: IO ()
main = mainWith packing
