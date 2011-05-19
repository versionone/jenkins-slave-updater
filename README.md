# Jenkins Slave Updater
A simple Powershell script for upgrading Jenkins' slaves.

Yeah, we realize it's weird that a butler needs a butler, but...

## Installing
It's easy, just copy the `jenkins-slave-updater.ps1` script into your `c:\jenkins-slave\` directory (adjust that path for your needs.)

If you're outside of VersionOne, you'll need to update the URL of the Master Jenkins server inside the script.

_NOTE_: You may need to configure Powershell to allow this script to be run. A simple, and likely dumb, way to do this is to run `> set-executionpolicy unrestricted`.

## Using
Just run the script with Powershell on the slave!

## WTF is going on?
This script stops the running "Jenkins Slave" service, pulls down the latest `slave.jar` from the master server, and restarts the service.

### Warranty & License
This is FREE and open for anyone. If it breaks, feel free to keep both pieces.

### Contributing
Fork, change, submit pull request.
