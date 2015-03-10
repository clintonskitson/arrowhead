{
  :boxes => [
    {
      :hostname  =>  'puppetmaster',
      :common_location_name => 'us_central',
      :common_instance_type => 'micro',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetmaster',
    },
    {
      :hostname  =>  'tb',
      :common_location_name => 'us_central',
      :common_instance_type => 'micro',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
      :storage => "100",
    },
    {
      :hostname  =>  'mdm1',
      :common_location_name => 'us_central',
      :common_instance_type => 'micro',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
      :storage => "100",
    },
    {
      :hostname  =>  'mdm2',
      :common_location_name => 'us_central',
      :common_instance_type => 'micro',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
      :storage => "100",
    },
  ],

  :boxes_type => 'puppetagent',
#  :config_param => '{
#      :etcd_url => "https://discovery.etcd.io/33b91d0a7877a694de893efe48f68a10",
#    }',
#  :firewall => 'default',
}
