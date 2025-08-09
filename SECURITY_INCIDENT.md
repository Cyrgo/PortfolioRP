# Security Incident Report

## ⚠️ License Key Exposure Incident

**Date**: December 2024  
**Severity**: HIGH  
**Status**: MITIGATED (Ongoing)

## What Happened
A FiveM license key (`cfxk_E3s7Q34PUEYH2d3sSCR5_4FZlFu`) was accidentally committed to this public GitHub repository in multiple commits.

## Impact
- License key exposed to the public
- Potential for server abuse or impersonation
- Security of the FiveM server compromised

## Actions Taken
1. ✅ Replaced exposed key with placeholder in server.cfg
2. ✅ Created server.cfg.template for safe distribution
3. ✅ Added security warnings and documentation
4. ⏳ **REQUIRED**: Original key must be revoked and replaced

## Actions Required (URGENT)
1. **Visit [FiveM Keymaster](https://keymaster.fivem.net)**
2. **Delete the exposed key**: `cfxk_E3s7Q34PUEYH2d3sSCR5_4FZlFu`
3. **Generate a new license key**
4. **Update your local server.cfg with the new key**
5. **Never commit the real key to version control**

## Prevention Measures
- server.cfg is now properly gitignored
- Use server.cfg.template for distribution
- Added security warnings in configuration files
- This incident report serves as documentation

## Git History Note
⚠️ **The exposed key is still present in git history.** While the current version is safe, the old key should be revoked immediately as anyone with access to the repository history can still see it.

## Lessons Learned
- Never commit sensitive credentials to version control
- Use environment variables or config templates for secrets
- Regular security audits of committed files are essential
- .gitignore files must be properly configured from the start