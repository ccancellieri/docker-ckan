#!/bin/bash
cd ${APP_DIR}/src_extensions/ckanext-jsonschema/ &&\
pip install -r requirements.txt &&\
python setup.py develop
paster --plugin=ckan config-tool /etc/ckan/production.ini -s app:main \
    "ckanext.jsonschema.solr.default.core_name=ckan_packages" \
    "ckanext.jsonschema.bucket_relative_path=metadata" \
    "ckanext.jsonschema.gcp_auth_path=${APP_DIR}/src_extensions/ckanext-cloudstorage/fao-maps-review-fa7e239468ba.json" \
    "ckanext.jsonschema.graph_indexer_api_key=random_fake_key" \
    "ckanext.jsonschema.titiler_base_url=https://data.dev.fao.org/geospatial/api" \
    "ckanext.jsonschema.bucket_indexer_enabled=true" \
    "ckanext.jsonschema.graph_indexer_enabled=true" \
    "ckanext.jsonschema.bucket_name=fao-catalog-dev-demo_final"
