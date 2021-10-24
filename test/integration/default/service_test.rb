%w(dhcp4 dhcp6 ctrl-agent dhcp-ddns).each do |srv|
  case os.family
  when 'redhat', 'linux'
    describe service("kea-#{srv}") do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  when 'debian'
    srv.concat('-server') unless srv.eql?('ctrl-agent')
    describe service("isc-kea-#{srv}") do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  end
end

# DHCPv4
describe port(67) do
  it { should be_listening }
  its('protocols') { should cmp 'udp' }
  its('processes') { should include 'kea-dhcp4' }
end

# DHCPv6
describe port(547) do
  it { should be_listening }
  its('protocols') { should cmp 'udp6' }
  its('processes') { should include 'kea-dhcp6' }
end

# DHCP-DDNS
describe port(53001) do
  it { should be_listening }
  its('protocols') { should cmp 'udp' }
  its('processes') { should include 'kea-dhcp-ddns' }
end

# Kea Ctrl Agent
describe port(8000) do
  it { should be_listening }
  its('protocols') { should cmp 'tcp' }
  its('processes') { should include 'kea-ctrl-agent' }
end

%w(agent server).each do |srv|
  describe service("isc-stork-#{srv}") do
    it { should be_installed }
    it { should be_enabled }
    # it { should be_running }
  end
end
