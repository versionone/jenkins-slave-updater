# version 0.2.0
# for more info, see: https://github.com/versionone/jenkins-slave-updater

echo "=== Stopping Jenkins Slave ==="
$jenkins = get-service -displayname "Jenkins Slave"
$jenkins.Stop()
$jenkins.WaitForStatus("Stopped")

echo "=== Getting new slave.jar from Master server ==="
invoke-command -scriptblock { curl -O "http://ci-server.corp.versionone.net/jnlpJars/slave.jar" }

echo "=== Starting Jenkins Slave ==="
$jenkins.Start()
$jenkins.WaitForStatus("Running")
echo "=== Jenkins Slave is running ==="
