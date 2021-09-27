case os.family
when 'redhat', 'linux'
  describe service('kea-dhcp4') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
when 'debian'
  describe service('isc-kea-dhcp4-server') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
