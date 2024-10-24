# docker build -t local.registry/ckan-dev:2.8.12 -f 2.8/Dockerfile .
# docker build -t local.registry/ckan-base:2.8.6 -f src/ckan/Dockerfile .
#docker build -t local.registry/ckan-dev:2.8.6 -f 2.8/Dockerfile-debian  .   

# Build local base registry
# from root folder project:
cd src/ckan
docker build -t local.registry/ckan-base:2.8.6 .

# Build local ckan dev registry
# from root folder project:
cd ckan-dev
docker build -t local.registry/ckan-dev:2.8.6 -f 2.8/Dockerfile-debian .

# # start docker compose
# Docker compose up

# # if you encounter error: user does not exit
# cd /usr/lib/ckan/venv/src/ckan
# paster --plugin=ckan db init -c /etc/ckan/production.ini

# # add ckan_admin user as sysadmin
# cd /usr/lib/ckan/venv/src/ckani
# paster sysadmin add ckan_admin -c /etc/ckan/production.ini
 