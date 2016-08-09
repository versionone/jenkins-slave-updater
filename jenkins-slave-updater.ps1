# version 0.2.0
# for more info, see: https://github.com/versionone/jenkins-slave-updater

param (
     [int]$sleep = 0
)

Start-Sleep -s $sleep

# Get Service name & master Server from Agent XML
[xml]$data = Get-Content "$PSScriptRoot\jenkins-slave.xml"
$args = $data.service.arguments
$masterUrlMatch = [regex]
if ($args -match "-jnlpUrl (http[^ ]*)/computer/[^ /]*/slave-agent.jnlp ") {
	$base = $matches[1]
} else {
	$base = "http://ci-server.corp.versionone.net/"
}
$servicename = $data.service.id

echo "=== Stopping Jenkins Slave ==="
$jenkins = get-service -name $servicename
$jenkins.Stop()
$jenkins.WaitForStatus("Stopped")

echo "=== Getting new slave.jar from Master server $base ==="
Invoke-WebRequest "$base/jnlpJars/slave.jar" -OutFile "$PSScriptRoot\slave.jar"

echo "=== Starting Jenkins Slave ==="
$jenkins.Start()
$jenkins.WaitForStatus("Running")
echo "=== Jenkins Slave is running ==="
