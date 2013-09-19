module TryToBeEvil where

-- This is a rather stupid example to quickly demonstrate how
-- Haskell fails to be "evil" and prevents a nasty side effect.

launch_missiles :: String
launch_missiles = "Sir, yes Sir!"

add :: Int -> Int -> Int
add a b = launch_missiles
