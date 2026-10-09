class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.033545.7f1c81e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-033545-7f1c81e/marvel-darwin-arm64"
    sha256 "1ec2b4b524f0ab81083e2be57d2b1d3b01b9e2a5c11cfcf48ae44ad3079165f5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-033545-7f1c81e/marvel-darwin-amd64"
    sha256 "96439f529dc0ee7d542d103af58596dc5fc3f6e5c5fd2424cfb291f0aff31a53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-033545-7f1c81e/marvel-linux-arm64"
    sha256 "e61d449e461d366e94cc7c8017e58ed8c8bfb13ee9ff67cb8ebca42bf2512a87"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-033545-7f1c81e/marvel-linux-amd64"
    sha256 "db93dcfacdbd67dfa025cd959774361004fb42ffa05713a42060585b7d77a059"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
