name 'ubuntu-server'
run_list 'ubuntu-14-hardening::default'
default_source :supermarket, 'https://supermarket.chef.io'
cookbook 'ubuntu-14-hardening', path: '.'
# cookbook "jenkins", "~> 2.1"
# cookbook "mysql", github: "chef-cookbooks/mysql", branch: "master"
