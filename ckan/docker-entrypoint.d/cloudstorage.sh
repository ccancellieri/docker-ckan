#!/bin/bash
cd ${APP_DIR}/src_extensions/ckanext-cloudstorage/ &&\
pip install -r requirements.txt &&\
python setup.py develop
paster --plugin=ckan config-tool /etc/ckan/production.ini -s app:main \
    "ckanext.cloudstorage.driver=GOOGLE_STORAGE" \
    "ckanext.cloudstorage.container_name=fao-maps-review-ckan-test-cloudstorage" \
    "ckanext.cloudstorage.use_secure_urls=True" \
    "ckanext.cloudstorage.service_account_key_path=${APP_DIR}/src_extensions/ckanext-cloudstorage/fao-maps-review-fa7e239468ba.json" \
    "ckanext.cloudstorage.gcp_base_url=https://gcp.fao.org/groups-service/api/v1"\
    "ckanext.cloudstorage.prefix=fao-catalog-dev-"\
    "ckanext.cloudstorage.domain=fao.org"\
    "ckanext.cloudstorage.transition=True"\
    "ckanext.cloudstorage.cors_config=${APP_DIR}/src_extensions/ckanext-cloudstorage/ckanext/cloudstorage/setup/cors_config.json"
    # "ckan.site_url=http://localhost:5000" \
    # "ckan.root_path=/" \
    # "ckan.storage_path=/var/lib/ckan" 