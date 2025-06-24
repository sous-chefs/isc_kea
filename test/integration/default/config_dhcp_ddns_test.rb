describe file('/etc/kea/kea-dhcp-ddns.conf') do
  it { should be_file }
end

describe json('/etc/kea/kea-dhcp-ddns.conf') do
  its(%w(DhcpDdns control-socket socket-name)) { should eq '/var/run/kea/kea-ddns-ctrl-socket' }
  its(%w(DhcpDdns control-socket socket-type)) { should eq 'unix' }
  its(%w(DhcpDdns ip-address)) { should eq '127.0.0.1' }
  its(%w(DhcpDdns ncr-format)) { should eq 'JSON' }
  its(%w(DhcpDdns port)) { should eq 53001 }
  its(['DhcpDdns', 'forward-ddns', 'ddns-domains', 0, 'key-name']) { should eq 'd2.md5.key' }
  its(['DhcpDdns', 'forward-ddns', 'ddns-domains', 0, 'dns-servers', 0, 'ip-address']) { should eq '2001:db8:1::10' }
  its(['DhcpDdns', 'reverse-ddns', 'ddns-domains', 0, 'key-name']) { should eq 'd2.sha1.key' }
  its(['DhcpDdns', 'reverse-ddns', 'ddns-domains', 0, 'dns-servers', 0, 'ip-address']) { should eq '172.16.1.1' }
  its(['DhcpDdns', 'tsig-keys', 0, 'algorithm']) { should eq 'HMAC-MD5' }
  its(['DhcpDdns', 'tsig-keys', 1, 'algorithm']) { should eq 'HMAC-SHA1' }
end
