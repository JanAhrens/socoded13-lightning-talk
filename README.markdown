# So Coded 2013: Lightning talk

This is a lightning talk I put together at the so coded conference
2013. It's indented to get people interested in using functional
programming languages for web development. If you already know about
Haskell, Scala, Clojure or any other FP language, this might not be your
talk.

# Reading the slides

I choose to write my slides in plaintext using markdown. You'll
only need a fullscreen terminal with a large font.

If you don't want to output each slide individually, you can type
in this small script, that abuses `read` as a "next-slide" tool.
Just press RETURN to go to the next slide.

    for file in slides/*.markdown; do
      clear
      cat $file
      read
    done

# The demo part

This talk contained a little demo that tries to show how easy and
powerful Yesod is. I showed how to scaffold a handler, implement
that handler, modify that handler and how Yesod will sanitize input.

If you want to do try that demo yourself, you'll need a fully
functional Haskell and Yesod environment.
You can use
[Yesod quickstart](https://github.com/JanAhrens/yesod-quickstart.git)
to build a virtual machine.

Before the talk a initialized a vanilla Yesod project (to safe
some time).

    $ yesod init
    $ cd socoded
    $ cabal install && yesod devel

## Scaffold a handler

Create a new handler called `Hello` with the `GET` route `/hello`.

    $ yesod add-handler

Visit `http://localhost:3000/hello` to see that the handler is not yet
implemented.

## Implement the handler

Implement the handler:

```haskell
getHelloR = defaultLayout [whamlet|<h1>Hello|]
```

Visit `http://localhost:3000/hello` and see that it works.

## Get the handler to take URL params

Modify the handler to accept to handle request like `/hello/SoCoded`.

```haskell
getHelloR :: String -> Handler RepHtml
getHelloR name = defaultLayout [whamlet|<h1>Hello #{name}|]
```

- stop the `yesod devel` command by hitting RETURN and start it again (the
route changed).
- visit `http://localhost:3000/hello/SoCoded` to see that
it's works as intended.

## Try to abuse the implementation

To demonstrate that Yesod knows what to do when returning HTML, try to
provoke an XSS using the handler: `http://localhost:3000/hello/<script>alert`

Yesod automatically knows that it has to escape the `String` in order to
print it. Voila!
