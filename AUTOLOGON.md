# Reinstall AutoLogon

This directory is a snapshot of `enamribu/reinstall` with one behavioral
addition: Windows automatically signs in to the built-in Administrator account
once after setup.

Only these upstream files are modified:

- `windows.xml` adds `AutoLogon` and clears `AutoLogonCount` after first sign-in.
- `trans.sh` injects the existing encoded Windows password into `AutoLogon`.

`reinstall.sh` already creates both required password encodings and remains
unchanged.

All `.sh` files in this directory use Linux LF line endings. Upload the complete
directory to the fork; CRLF shell files fail under Linux with exit status 2.

## Deployment

The directory must be published at a raw HTTP(S) URL before VPSMultiTool can use
it. The installer continues after the source VPS reboots, so files available
only on the desktop PC are not sufficient.

After publishing, update both URLs in VPSMultiTool's Windows Fresh command:

1. Download `reinstall.sh` from the published repository.
2. Point the script's `confhome` variable to the same repository and branch.

Do not point the application at this local directory until a reachable raw URL
exists.
