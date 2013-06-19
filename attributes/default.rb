attributes = {
  'update_package_lists' => true,
  'update_packages' => true,
  'origins' => [],
  'blacklist' => [],
  'email' => 'root',
  'only_mail_on_error' => false,
  'speed_limit' => nil
}

case node['platform']
when 'debian'
  attributes['origins'] << 'origin=Debian,archive=stable,label=Debian-Security'
when 'ubuntu'
  attributes['origins'] << '${distro_id}:${distro_codename}-security'
end

default['unattended-upgrades'] = attributes
