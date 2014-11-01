#
# Cookbook Name:: turbobil
# Recipe:: iptables
#

# unicorn redirect
include_recipe "simple_iptables"
simple_iptables_rule "unicorn-iptables" do
  table "nat"
  direction "PREROUTING"
  rule [ "--protocol tcp --dport 80 --jump REDIRECT --to-port 8080"]
  jump false
end
