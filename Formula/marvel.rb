class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.202602.adf6c65"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-202602-adf6c65/marvel-darwin-arm64"
    sha256 "b8a5eec3ecd41d44049e7c5f3bc9ca1e3b80e92ff5f05cf6a901c5e7010dd0db"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-202602-adf6c65/marvel-darwin-amd64"
    sha256 "71712dc593cfff1e3fd1906997b14bce55c886ffe469d7e02ce2f25a6be0147a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-202602-adf6c65/marvel-linux-arm64"
    sha256 "f84b769fe7a2ee05eda7e9cb1922577dd94b5d66b499470bfb60a0c12f5be0df"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-202602-adf6c65/marvel-linux-amd64"
    sha256 "da397c639bf8141061bc63359be90c981d0a1a8947849adc0f9e555f1c3e841d"
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
