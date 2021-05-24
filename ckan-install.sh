sudo apt update
sudo add-apt-repository universe
sudo apt install python3.7-distutils
sudo apt-get install python3-distutils
sudo apt install -y libpq5 redis-server nginx supervisor
wget http://packaging.ckan.org/python-ckan_2.9-py3-focal_amd64.deb
sudo dpkg -i python-ckan_2.9-py3-focal_amd64.deb

sudo apt install -y postgresql
sudo service postgresql start
sudo -u postgres psql -l
sudo -u postgres createuser -S -D -R -P ckan_default
sudo -u postgres createdb -O ckan_default ckan_default -E utf-8
# Note:
# edit ckan.ini sqlalchemy.url with the new password

sudo apt install -y solr-jetty
sudo mv /etc/solr/conf/schema.xml /etc/solr/conf/schema.xml.bak
sudo ln -s /usr/lib/ckan/default/src/ckan/ckan/config/solr/schema.xml /etc/solr/conf/schema.xml
# Note: 
# Edit jetty port from 8080 to 8983
sudo service jetty9 restart

# Edit ckan config (sudo vi ckan.ini) and uncomment solr_url entry
# solr_url=http://127.0.0.1:8983/solr
sudo ckan db init

. /usr/lib/ckan/default/bin/activate
cd /usr/lib/ckan/default/src/ckan
ckan -c /etc/ckan/default/ckan.ini sysadmin add admin email=admin@org name=admin

sudo ckan -c /etc/ckan/default/ckan.ini run

sudo killall supervisord
sudo supervisord -c /etc/supervisor/supervisord.conf
sudo supervisorctl reload
sudo supervisorctl status

sudo service nginx restart
