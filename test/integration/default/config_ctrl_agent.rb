describe file('/etc/kea/kea-ctrl-agent.conf') do
  it { should be_file }
end

describe json('/etc/kea/kea-ctrl-agent.conf') do
  its(%w(Control-agent control-sockets d2 socket-name)) { should eq '/tmp/kea-ddns-ctrl-socket' }
  its(%w(Control-agent control-sockets dhcp4 socket-name)) { should eq '/tmp/kea4-ctrl-socket' }
  its(%w(Control-agent control-sockets dhcp6 socket-name)) { should eq '/tmp/kea6-ctrl-socket' }
  its(%w(Control-agent http-host)) { should eq '127.0.0.1' }
  its(%w(Control-agent http-port)) { should eq 8000 }
  its(['Control-agent', 'loggers', 0, 'debuglevel']) { should eq 0 }
  its(['Control-agent', 'loggers', 0, 'name']) { should eq 'kea-ctrl-agent' }
  its(['Control-agent', 'loggers', 0, 'output_options', 0, 'flush']) { should eq true }
end
