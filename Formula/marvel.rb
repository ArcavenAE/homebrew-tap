class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.221957.55e721f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-221957-55e721f/marvel-darwin-arm64"
    sha256 "fa38959d62b767f00ece5d71977e97cf73d9aa07af67b97aff8b3617f5ea7ee4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-221957-55e721f/marvel-darwin-amd64"
    sha256 "dc244f2281bf2935eddba45adc1c90ad71dd18838dd751ad120cd05f28b297a5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-221957-55e721f/marvel-linux-arm64"
    sha256 "bb6124f47b6983614bbdb4b59047fbb1a2d4857042f12701b89d04588b572cea"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-221957-55e721f/marvel-linux-amd64"
    sha256 "bcabbc0042dc476c460b3205beb0ef59524b43a52dacb3f2881dfd4232b78449"
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
