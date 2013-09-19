
            [33mHaskell isn't evil[39m


- Function signatures

    add :: Int -> Int -> Int

    launch_missiles :: String
    launch_missiles = "Sir, yes Sir!"

- Haskell tries to be evil ..

    add a b = [31mlaunch_missiles[39m

- .. and fails

    $ ghci TryToBeEvil.hs

    TryToBeEvil.hs:10:11:
        Couldn't match expected type `Int' with actual type `String'
        In the expression: launch_missiles
        In an equation for `add': add a b = launch_missiles
