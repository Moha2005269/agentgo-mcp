# Privacy

AgentGo and this MCP server collect nothing about you.

- **No telemetry, analytics, crash uploads or accounts.** Neither the browser nor the MCP server sends usage data anywhere.
- **Everything stays on your computer.** The MCP server talks only to the AgentGo browser on the same machine, over a local named pipe or a child process's stdio. Your history, bookmarks, cookies and saved sign-ins live in `%LOCALAPPDATA%\AgentGo`.
- **The browser connects only where you or your agent go**, plus a few connections tied to something you asked for (search, translate, extension installs, update checks, accounts you connect). The full list is in [NETWORK_CALLS.md](https://github.com/Moha2005269/agentgo/blob/main/docs/NETWORK_CALLS.md).
- **Your agent's model provider** sees the page outlines and results your agent reads, under that provider's own terms. AgentGo makes no model calls itself; GoMini, the optional local model, runs on your GPU.

Questions: [open an issue](https://github.com/Moha2005269/agentgo/issues).
