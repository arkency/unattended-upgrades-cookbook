defaults = node['unattended-upgrades']

package 'unattended-upgrades'

update_package_lists = to_bin(defaults['update_package_lists'])
update_packages      = to_bin(defaults['update_packages'])

template '/etc/apt/apt.conf.d/20auto-upgrades' do
  source 'auto-upgrades.erb'

  owner 'root'
  group 'root'
  mode  '0644'

  variables :update_package_lists => update_package_lists,
            :update_packages      => update_packages
end

template '/etc/apt/apt.conf.d/50unattended-upgrades' do
  case node['platform']
  when 'debian' then source 'unattended-upgrades.erb'
  when 'ubuntu' then source 'unattended-upgrades-ubuntu.erb'
  end

  owner 'root'
  group 'root'
  mode  '0644'

  variables :only_mail_on_error => defaults['only_mail_on_error'],
            :email              => defaults['email'],
            :speed_limit        => defaults['speed_limit'],
            :blacklist          => Array(defaults['blacklist']),
            :origins            => Array(defaults['origins'])
end
