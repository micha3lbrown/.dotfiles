# GPG Reference
All good things come from [Dr Duh's Yubikey Guide](https://github.com/drduh/YubiKey-Guide)

### Load master key
1. Insert backup thumbdrive and decrypt
2. `cd /Volumes/$KEYID/.gnupg`
3. `export GNUPGHOME=$(pwd)`
4. Verify
    ```
    gpg --expert --edit-key $KEYID
    ```
