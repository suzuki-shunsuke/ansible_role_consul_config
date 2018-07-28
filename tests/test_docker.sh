echo $0
cd `dirname $0`
echo "PWD: $PWD"

echo "> docker-compose up -d"
docker-compose up -d # [--force-recreate]
echo '> CONTAINER_ID=`docker-compose ps -q`'
CONTAINER_ID=`docker-compose ps -q`
echo "> write container id to docker"
cat << EOS > docker
[default]
test ansible_host=$CONTAINER_ID
EOS
ansible-playbook -c docker -u foo -i docker test.yml
# docker-compose stop
# docker-compose rm
