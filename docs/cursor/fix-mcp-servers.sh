#!/bin/bash
# MCP Server Configuration Fix Script
# This script helps fix common MCP server configuration issues

set -e

echo "🔧 MCP Server Fix Script"
echo "========================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    MCP_CONFIG_PATH="$HOME/.cursor/mcp.json"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    MCP_CONFIG_PATH="$HOME/.cursor/mcp.json"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    OS="windows"
    MCP_CONFIG_PATH="$HOME/.cursor/mcp.json"
    # Windows path conversion
    if [ -n "$USERPROFILE" ]; then
        MCP_CONFIG_PATH=$(echo "$USERPROFILE" | sed 's|\\|/|g')/.cursor/mcp.json
    fi
else
    OS="unknown"
    MCP_CONFIG_PATH="$HOME/.cursor/mcp.json"
fi

echo "📋 Detected OS: $OS"
echo "📁 MCP Config Path: $MCP_CONFIG_PATH"
echo ""

# Check if config file exists
if [ ! -f "$MCP_CONFIG_PATH" ]; then
    echo -e "${YELLOW}⚠️  MCP config file not found at $MCP_CONFIG_PATH${NC}"
    echo "Creating new configuration file..."
    
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$MCP_CONFIG_PATH")"
    
    # Create default config
    cat > "$MCP_CONFIG_PATH" << 'EOF'
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:/Users/mello/OneDrive/Documents/Slot",
        "C:/Users/mello/OneDrive/Documents/Mytel bypass",
        "C:/Users/mello/OneDrive/Documents/Desktop/npvtfiles",
        "C:/Users/mello"
      ]
    }
  }
}
EOF
    echo -e "${GREEN}✅ Created new MCP configuration file${NC}"
else
    echo -e "${GREEN}✅ Found existing MCP configuration file${NC}"
fi

echo ""
echo "🔍 Checking for common issues..."
echo ""

# Check if filesystem MCP uses deprecated command
if grep -q '"command": "mcp-server-filesystem"' "$MCP_CONFIG_PATH" 2>/dev/null; then
    echo -e "${YELLOW}⚠️  Found deprecated filesystem command${NC}"
    echo "   Fix: Update to use 'npx' with '@modelcontextprotocol/server-filesystem'"
fi

# Check if paths use backslashes
if grep -q '\\\\' "$MCP_CONFIG_PATH" 2>/dev/null; then
    echo -e "${YELLOW}⚠️  Found backslashes in paths${NC}"
    echo "   Fix: Use forward slashes (/) instead of backslashes (\\)"
fi

# Check if GitHub MCP is missing
if ! grep -q '"github"' "$MCP_CONFIG_PATH" 2>/dev/null; then
    echo -e "${YELLOW}⚠️  GitHub MCP not configured${NC}"
    echo "   Fix: Add GitHub MCP configuration (see mcp-server-fixes.md)"
fi

echo ""
echo "📝 Summary of fixes needed:"
echo "   1. Filesystem MCP: Use 'npx @modelcontextprotocol/server-filesystem'"
echo "   2. Path format: Use forward slashes (/) for all paths"
echo "   3. GitHub MCP: Add configuration if needed"
echo "   4. Datadog: Configure DD_MCP_DOMAIN in plugin config"
echo ""
echo "📖 See docs/cursor/mcp-server-fixes.md for detailed instructions"
echo ""
echo "✅ Script completed. Please review the configuration file and apply fixes manually."
echo "   After making changes, reload Cursor window (Ctrl+Shift+P → 'Reload Window')"
