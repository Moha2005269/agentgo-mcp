# Builds the offline MCP server: it answers initialize and tools/list with
# AgentGo's real tool list. The browser itself runs on Windows 11.
FROM rust:1-slim-bookworm AS build
WORKDIR /src
COPY . .
RUN cargo build --release --locked -p agentgo-mcp --bin agentgo-mcp-offline

FROM debian:bookworm-slim
COPY --from=build /src/target/release/agentgo-mcp-offline /usr/local/bin/agentgo-mcp-offline
ENTRYPOINT ["agentgo-mcp-offline"]
