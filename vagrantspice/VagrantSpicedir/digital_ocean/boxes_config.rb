{
  :boxes => [
    {
      :hostname  =>  'puppetmaster',
      :common_location_name => 'us_west',
      :common_instance_type => 'micro',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetmaster',
    },
    {
      :hostname  =>  'mdm1',
      :common_location_name => 'us_west',
      :common_instance_type => 'medium',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
    },
    {
      :hostname  =>  'tb',
      :common_location_name => 'us_west',
      :common_instance_type => 'medium',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
    },
    {
      :hostname  =>  'mdm2',
      :common_location_name => 'us_west',
      :common_instance_type => 'medium',
      :common_image_name => 'CentOS-7-x64',
      :type => 'puppetagent',
    },
  ],

  :boxes_type => 'puppetagent',

}
