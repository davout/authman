# Authman

Generate time-based OTPs, the ones used by Google Authenticator for example, from the command-line

## Usage
Install the gem:
````
gem install authman
````

Create your settings file at `~/.authman.json`
`````json
{
  "Paymium":       "<secret>",
  "Amazon":        "<secret>",
  "Other service": "<secret>"
}
````

Encrypt the file with GPG
````
cat ~/.authman.json | gpg -a -e -r <your-key> -s -u <your-key> > ~/.authman.asc
````

Remove the clear-text version
````
rm ~/.authmane.json
````

Run `authman`, and here you go, your OTPs are displayed in the shell window and updated as necessary, exit with Ctrl-C.

