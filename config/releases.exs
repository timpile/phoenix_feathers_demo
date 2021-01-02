import Config

config :phoenix_feathers_demo, PhoenixFeathersDemoWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: nil, port: 443]
