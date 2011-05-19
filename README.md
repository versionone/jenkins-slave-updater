# Jenkins Slave Updater
A simple Powershell script for upgrading Jenkins' slaves.

Yeah, we realize it's weird that a butler needs a butler, but...

## Installing
It's easy, just copy the `jenkins-slave-updater.ps1` script into your `c:\jenkins-slave\` directory (adjust that path for your needs.)

If you're outside of VersionOne, you'll need to update the URL of the Master Jenkins server inside the script.

## Using
Just run the script with Powershell!

## WTF is going on?
This script stops the running "Jenkins Slave" service, pulls down the latest `slave.jar` from the master server, and restarts the service.

### Contributing
Fork, change, submit pull request.
