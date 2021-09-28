describe file('/etc/kea/kea-dhcp4.conf') do
  it { should be_file }
end

describe json('/etc/kea/kea-dhcp4.conf') do
  its(%w(Dhcp4 interfaces-config interfaces)) { should include 'eth0' }
  its(['Dhcp4', 'subnet4', 0, 'subnet']) { should eq '192.0.2.0/24' }
  its(['Dhcp4', 'subnet4', 1, 'subnet']) { should eq '192.0.3.0/24' }
end
