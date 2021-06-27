# PollingToSocket

WARNING: This is extremely alpha software. Expect breaking changes.

Ideas and notes here: https://www.craft.do/s/4wu9pq8h4d55Qr

# Running Locally

## Server

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Try with a client

For this you'll have to use a websocket client. I recommend something like [`wscat`](https://github.com/websockets/wscat) or [`websocet`](https://github.com/vi/websocat)

```
↪ wscat -c "ws://localhost:4000/socket/websocket"
Connected (press CTRL+C to quit)

> {"ref": "1","topic":"poll:lobby","event":"phx_join","payload":{"interval":5000,"request": {"method": "get","url": "http://httpbin.org/json"}}}

< {"event":"phx_reply","payload":{"response":{},"status":"ok"},"ref":"1","topic":"poll:lobby"}

< {"event":"received_data","payload":{"body":"{\n  \"slideshow\": {\n    \"author\": \"Yours Truly\", \n    \"date\": \"date of publication\", \n    \"slides\": [\n      {\n        \"title\": \"Wake up to WonderWidgets!\", \n        \"type\": \"all\"\n      }, \n      {\n        \"items\": [\n          \"Why <em>WonderWidgets</em> are great\", \n          \"Who <em>buys</em> WonderWidgets\"\n        ], \n        \"title\": \"Overview\", \n        \"type\": \"all\"\n      }\n    ], \n    \"title\": \"Sample Slide Show\"\n  }\n}\n","headers":{"Access-Control-Allow-Credentials":"true","Access-Control-Allow-Origin":"*","Connection":"keep-alive","Content-Length":"429","Content-Type":"application/json","Date":"Sun, 27 Jun 2021 00:23:23 GMT","Server":"gunicorn/19.9.0"}},"ref":null,"topic":"poll:lobby"}

```

## Resources for Phoenix

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
