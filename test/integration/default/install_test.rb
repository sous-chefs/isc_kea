%w(isc-kea isc-kea-devel isc-kea-hooks isc-kea-libs isc-kea-shell).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
