# Claude Code Instructions

## Security: Check for confidential data before commits

This is a public repository. Before committing any file, always check for:

- Passwords and secrets
- API keys and tokens
- SSH private keys (public keys are fine)
- Personal access tokens
- Database credentials
- Email addresses (if user prefers privacy)
- Hostnames/IPs of private servers

### How to check

```bash
# Search for common secret patterns
grep -riE "(password|secret|token|api.?key|private.?key|credential)" <file>

# For plist files, convert and search
plutil -p <file.plist> | grep -iE "(password|secret|token|key|auth)"
```

### Safe to commit

- SSH public keys (start with `ssh-rsa`, `ssh-ed25519`, etc.)
- Public API endpoints (URLs without keys)
- Configuration preferences and settings
- Color schemes, fonts, UI preferences
