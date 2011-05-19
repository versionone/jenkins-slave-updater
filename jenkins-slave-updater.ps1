echo "=== Stopping Jenkins Slave ==="
$jenkins = get-service -displayname "Jenkins Slave"
$jenkins.Stop()
$jenkins.WaitForStatus("Stopped")

echo "=== Getting new slave.jar from Master server ==="
$updater = start-job -name JenkinsSlaveUpdater { curl -O http://ci-server.corp.versionone.net/jnlpJars/slave.jar }
wait-job $updater
receive-job -j $updater

echo "=== Starting Jenkins Slave ==="
$jenkins.Start()
$jenkins.WaitForStatus("Running")
echo "=== Jenkins Slave is running ==="
