<p align="center">
  <a href="https://github.com/Moha2005269/agentgo"><img src="https://raw.githubusercontent.com/Moha2005269/agentgo/main/assets/hero.svg" alt="AgentGo, the browser that fits you and your agent" width="100%"></a>
</p>

<p align="center">
  <b>This is AgentGo's MCP server. The browser lives in the main repo.</b><br>
  <a href="https://github.com/Moha2005269/agentgo">⭐ Star AgentGo</a> &nbsp;·&nbsp;
  <a href="https://github.com/Moha2005269/agentgo/releases/latest">⬇ Download for Windows 11</a> &nbsp;·&nbsp;
  <a href="https://github.com/Moha2005269/agentgo/blob/main/docs/benchmarks/agentgo-0.1.5.md">Benchmark</a>
</p>

# agentgo-mcp

The MCP server for [AgentGo](https://github.com/Moha2005269/agentgo), the browser your AI agent drives. MIT licensed.

AgentGo is a real Chromium browser for Windows 11, built for agents. This repository is the part your agent talks to: the MCP server, the local control protocol it speaks to the browser, the command registry and the policy types. The browser itself lives in the main repository.

- **Compact pages.** `browser_open` and `browser_read` return a short outline: headings plus interactive elements as `[ref] role "name"`.
- **Only what changed.** `browser_act` and `browser_batch` use real mouse and keyboard input, wait for the page to settle, and reply with the diff, not the whole page again.
- **The human stays in charge.** Payments and final submissions come back as `approval.required`; the agent calls `browser_wait_human` and you approve in the browser.
- **Accounts without tokens.** `browser_account` calls the APIs of accounts you linked, without the agent ever holding a token.
- **GoMini.** When the on-device model is on, `browser_delegate` hands it routine steps.

On 24 BrowserGym MiniWoB++ tasks with the same model, AgentGo solved 22, browser-use 19 and Playwright MCP 18 ([method and results](https://github.com/Moha2005269/agentgo/blob/main/docs/benchmarks/agentgo-0.1.5.md)).

## Tools

`browser_open`, `browser_read`, `browser_act`, `browser_batch`, `browser_wait`, `browser_tabs`, `browser_screenshot`, `browser_wait_human`, `browser_guide`, `browser_account`, `browser_call`, plus `browser_delegate` when GoMini is on.

## Use it

Install AgentGo from the [latest release](https://github.com/Moha2005269/agentgo/releases/latest). Its installer connects Claude Code, Codex or Droid for you, using `agentgo mcp`.

To run this server from source instead:

```bash
cargo build --release -p agentgo-mcp --bin agentgo-mcp
```

Then point your MCP client at `target/release/agentgo-mcp`. It attaches to the newest running AgentGo, or starts `agentgo` from PATH (set `AGENTGO_EXE` to use another path).

```json
{ "mcpServers": { "agentgo": { "command": "C:\\path\\to\\agentgo-mcp.exe" } } }
```

### Offline mode

`agentgo-mcp-offline` builds on any OS and answers `initialize` and `tools/list` with the real tool list, with no browser behind it. Tool calls explain where to get AgentGo. It exists so MCP directories can check the server; the `Dockerfile` builds it.

## Layout

| Crate | What it is |
|---|---|
| `crates/agentgo-mcp` | The stdio MCP server and the protocol client |
| `crates/agentgo-protocol` | Message envelopes, framing, versions, typed errors |
| `crates/agentgo-shell-bridge` | The registry of browser commands |
| `crates/agentgo-policy` | Modes, risk levels, scopes, prompt-injection checks |
| `skills/agentgo` | The agent guide served by `browser_guide` |

Tests: `cargo test --workspace`.

This repository mirrors the same crates in the main AgentGo repository, where they are developed.

## License

MIT, see [`LICENSE`](LICENSE). The AgentGo browser itself is under the Business Source License 1.1.
