describe file('/etc/kea/kea-dhcp6.conf') do
  it { should be_file }
end

describe json('/etc/kea/kea-dhcp6.conf') do
  its(%w(Dhcp6 interfaces-config interfaces)) { should include 'eth0' }
  its(['Dhcp6', 'subnet6', 0, 'subnet']) { should eq '2001:db8:1::/64' }
end
