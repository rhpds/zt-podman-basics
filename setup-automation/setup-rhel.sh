!#/bin/bash
LOG=/dev/null

#while [ ! -f /opt/instruqt/bootstrap/host-bootstrap-completed ]
#do
#   echo "Waiting for Instruqt to finish booting the VM"
#   sleep 1
#done

# Removed in PZ migration
#yum remove -y google-rhui-client-rhel8.noarch
#yum clean all
#subscription-manager config --rhsm.manage_repos=1
#subscription-manager register --activationkey=${ACTIVATION_KEY} --org=12451665 --force

touch $LOG

#echo "Installing Podman" >> $LOG
#dnf -y install container-tools
pushd /tmp
sudo -u rhel podman pull docker.io/httpd
sudo -u rhel podman pull registry.access.redhat.com/ubi9/ubi
sudo -u rhel mkdir -p /home/rhel/my-httpd/html
cat << EOF >> /home/rhel/my-httpd/html/index.html
<html>
<head>
<title>
Super Businessey
</title>
</head>
<h2>This is my super businessey web site</h2>
</html>
EOF
chown -R rhel:rhel /home/rhel/my-httpd
popd

#Create a done file to signal we have finished
touch ${LOG}.done
n=1
GREEN='\033[0;32m' 
NC='\033[0m' # No Color

while [ ! -f ${LOG}.done ] ;
do
      if test "$n" = "1"
      then
	    clear
            n=$(( n+1 ))	 # increments $n
      else
	    printf "."
      fi
      sleep 2
done
clear
echo -e "${GREEN}Ready to start your scenario${NC}"
