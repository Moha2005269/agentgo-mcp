# Installing AgentGo for an AI agent

AgentGo is a Chromium browser for Windows 11 that agents drive over MCP. These steps are for an agent (such as Cline) setting it up for its user.

1. **Check the platform.** AgentGo runs on Windows 11 (x64) only. On other systems, stop and tell the user.
2. **Install the browser.** Download `AgentGo-Setup.exe` from https://github.com/Moha2005269/agentgo/releases/latest and ask the user to run it. The installer needs no administrator rights. When it finishes, `agentgo` is on PATH.
3. **Add the MCP server** to the client's MCP settings:

   ```json
   {
     "mcpServers": {
       "agentgo": {
         "command": "agentgo",
         "args": ["mcp"]
       }
     }
   }
   ```

   If `agentgo` is not on PATH, use the full path, usually `%LOCALAPPDATA%\Programs\AgentGo\agentgo.exe`.
4. **Check it works.** Call `browser_guide` once, then `browser_open` with `https://example.com`. The reply is a short outline with `[ref]` numbers.

No API keys are needed. Payments and final form submissions pause for the user to approve them in the AgentGo window; call `browser_wait_human` when a tool replies `approval.required`.
