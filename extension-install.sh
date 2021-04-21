pip install -r https://raw.githubusercontent.com/ckan/ckan/ckan-2.9.2/requirements.txt
pip install -r https://raw.githubusercontent.com/ckan/ckan/ckan-2.9.2/dev-requirements.txt
cd /usr/lib/ckan/default/src

sudo chown -R $USER /usr/lib/ckan/default
pip install -e 'git+https://github.com/ckan/ckanext-pages.git#egg=ckanext-pages'
# Note: update plugins in config file
#ckan.plugins = pages 

pip install -e git+https://github.com/ckan/ckanext-harvest.git#egg=ckanext-harvest

cd /usr/lib/ckan/default/src/ckanext-harvest/
pip install -r pip-requirements.txt
ckan --config=/etc/ckan/default/ckan.ini harvester initdb

# Note: Add the following in [app:main] section of config file
#ckan.harvest.mq.type = redis

# Note: update plugins in config file
#ckan.plugins = harvest ckan_harvester

sudo service jetty9 restart
