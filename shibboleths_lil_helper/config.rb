Slh.for_strategy :default do
  set :sp_entity_id, 'https://shib-local-vm1.asr.umn.edu/rhel5_sp1'
  set :idp_metadata_url, 'https://idp-test.shib.umn.edu/metadata.xml'
  set :error_support_contact, 'goggins@umn.edu'
  for_host 'shib-local-vm1.asr.umn.edu' do
    for_site 'shib-local-vm1.asr.umn.edu' do
      protect '/php_shib_dummy1'
    end
  end
end
