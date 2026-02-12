# Dotfiles 

{
  "alwaysThinkingEnabled": false,
  "env": {
    "CLAUDE_CODE_ENABLE_TELEMETRY": "1",
    "OTEL_METRICS_EXPORTER": "otlp",
    "OTEL_LOGS_EXPORTER": "otlp",
    "OTEL_EXPORTER_OTLP_PROTOCOL": "grpc",
    "OTEL_EXPORTER_OTLP_ENDPOINT": "http://localhost:4317",
    "OTEL_METRIC_EXPORT_INTERVAL": "10000",
    "OTEL_RESOURCE_ATTRIBUTES": "identifier=josh+claude@multitudes.com",
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "ANTHROPIC_MODEL": "us.anthropic.claude-sonnet-4-20250514-v1:0"
  }
}
      

Files here are managed using GNU stow. 

To track a config, first move it into the `dotfiles` folder in the root directory. 

```
mv .tmux.conf dotfiles/tmux/.tmux.conf
```

Then from the `dotfiles` directory run 
```
stow tmux
```

This will take the contents of the `tmux` directory and symlink it to `~/.tmux.conf`. Tmux can now find the config file via the symlink and yet it can be version-controlled from the `dotfiles` directory.

In the case of `/.aerospace.toml`, it will now show as symlinked into the dotfiles directory 

<img width="871" alt="image" src="https://github.com/user-attachments/assets/ca1ab6a4-ce97-47b1-ab68-820c547d2627" />
