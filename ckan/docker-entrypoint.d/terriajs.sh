#!/bin/bash

cd ${APP_DIR}/src_extensions/ckanext-terriajs/ &&\
pip install -r requirements.txt &&\
python setup.py develop
paster --plugin=ckan config-tool /etc/ckan/production.ini -s app:main \
    "ckanext.terriajs.default.name=TerriaJS Map" \
    "ckanext.terriajs.always_available=True" \
    "ckanext.terriajs.default.title=Map" \
    "ckanext.terriajs.url=http://localhost:8080" \
    "ckanext.terriajs.api_base_url_bucket=https://storage.googleapis.com" \
    "ckanext.terriajs.schema.type_mapping=${APP_DIR}/terriajs-type-mapping.json" &&\
cp ./type-mapping.json ${APP_DIR}/terriajs-type-mapping.json &&\
paster --plugin=ckan config-tool /etc/ckan/production.ini -s app:main \
    -e "ckan.views.default_views=image_view text_view recline_view terriajs"

# ckan config-tool /etc/ckan/default/ckan.ini -f custom_options.ini
