#!/bin/sh



files=(
  EMC-ScaleIO-sdc-1.31-1277.3.el7.x86_64.rpm
  EMC-ScaleIO-callhome-1.31-1277.3.el7.x86_64.rpm
  EMC-ScaleIO-lia-1.31-1277.3.el7.x86_64.rpm
  EMC-ScaleIO-sds-1.31-1277.3.el7.x86_64.rpm
  EMC-ScaleIO-mdm-1.31-1277.3.el7.x86_64.rpm
  EMC-ScaleIO-tb-1.31-1277.3.el7.x86_64.rpm
  EMC-ScaleIO-gui-1.31-1277.3.noarch.rpm
  EMC-ScaleIO-gateway-1.31-1277.3.noarch.rpm
)

for file in "${files[@]}"; do
  curl http://cdn.emccode.com/scaleio/$file -o /etc/puppet/modules/scaleio/files/$file
done
