{-# LANGUAGE CApiFFI                  #-}
{-# LANGUAGE ForeignFunctionInterface #-}

import           Foreign.C
import           Foreign.Marshal.Array
import           Foreign.Ptr           (Ptr, nullPtr)
import           Prelude               hiding (pi)

foreign import capi "mod.h SayHi" sayHi1 :: IO Int
foreign import capi "mod.h SayHi" sayHi2 :: IO ()
foreign import capi "mod.h BadSayHi" badSayHi1 :: IO Int
foreign import capi "mod.h BadSayHi" badSayHi2 :: IO ()
foreign import capi "mod.h pi" pi :: Double
foreign import capi "mod.h ruinPi" ruinPi :: IO ()


newLine::IO ()
newLine = putStrLn ""

cFuncToHFunc:: IO Int -> IO ()
cFuncToHFunc f = do
  x <- f
  if x==1 then return () else error "C function did not return 1"



main::IO ()
main = do
  print pi
  ruinPi -- ruinPI doesn't work I'm not sure why
  print pi
  x <- sayHi1
  print x -- print exit status
  sayHi2 -- cast as IO ()
  badSayHi2 -- will run despite error
  cFuncToHFunc badSayHi1 -- detects error and throws it in haskell
