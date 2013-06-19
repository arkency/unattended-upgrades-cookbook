Description
===========

Installs and configures `unattended-upgrades` Debian/Ubuntu package. This
package automatically installs system security upgrades and updates package
lists. It is recommended to have a MTA configured, as the logs are sent via an
email.

Attributes
==========

The default attributes hash looks like this:

    node['unattended-upgrades'] = {
      'update_package_lists' => true,
      'update_packages' => true,
      'origins' => [],
      'blacklist' => [],
      'email' => 'root',
      'mail_only_on_error' => false,
      'speed_limit' => nil
    }

You should overwrite `origins` attribute when you don't want to use default
origins.

Blacklist is a list of names of packages that should not be updated.

Speed limit is the maximal download speed in KB. When you don't want a limit it
should be set to `nil`.

License and Authors
===================

Author:: Arkency <dev@arkency.com>

Copyright 2012, Arkency

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
