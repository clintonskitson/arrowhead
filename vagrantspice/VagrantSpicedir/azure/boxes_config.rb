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
      :hostname  =>  'mdm1',
      :common_location_name => 'us_central',
      :common_instance_type => 'medium',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
      :storage => "110",
    },
    {
      :hostname  =>  'tb',
      :common_location_name => 'us_central',
      :common_instance_type => 'medium',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
      :storage => "110",
    },
    {
      :hostname  =>  'mdm2',
      :common_location_name => 'us_central',
      :common_instance_type => 'medium',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
      :storage => "110",
    },
  ],
  :boxes_type => 'puppetagent',
  :firewall => '6611:6611,8140:8140,9011:9011,7072:7072,443:443,9099:9099',
}
