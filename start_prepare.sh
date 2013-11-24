cd ~
cd current
rm -rvf solr/
rake sunspot:solr:start RAILS_ENV=production
rake sunspot:solr:reindex RAILS_ENV=production
