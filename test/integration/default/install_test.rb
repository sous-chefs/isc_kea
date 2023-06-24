case os.family
when 'redhat', 'linux'
  %w(isc-kea isc-kea-devel isc-kea-hooks isc-kea-common isc-kea-admin).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
when 'debian'
  %w(isc-kea-admin isc-kea-common isc-kea-ctrl-agent isc-kea-dev isc-kea-dhcp-ddns isc-kea-dhcp4 isc-kea-dhcp6 isc-kea-doc).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
