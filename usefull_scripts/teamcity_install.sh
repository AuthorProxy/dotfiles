# Prepare installation folder
mkdir /opt/jetbrains && cd /opt/jetbrains;

# Download and unzip the latest version
curl http://download-cf.jetbrains.com/teamcity/TeamCity-9.0.4.tar.gz | tar xvz;

# Setup permissions
useradd teamcity && chown -R teamcity:teamcity /opt/jetbrains/TeamCity;

# Create startup daemon script on init.d folder
touch /etc/init.d/teamcity;

# Install java dev kit
apt-get install default-jdk

# Setup it for autorun
update-rc.d teamcity defaults && chmod +x /etc/init.d/teamcity;

# Start server
service teamcity start

# Navigate to http://<your server>:8111/, click procceed and then reboot server
# http://blog.fire-development.com/2014/09/23/teamcity-8-setup-on-linux/
