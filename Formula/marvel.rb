class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.200844.2a6bad2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200844-2a6bad2/marvel-darwin-arm64"
    sha256 "404bc6e2bebfd58e26926c6cc55be987002699aedcf0969bb9edcdb33eb0f976"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200844-2a6bad2/marvel-darwin-amd64"
    sha256 "a69297a1f6209a5786a16f3bedc7881f4b1f03711b5ea4e692f885dc8a71e95d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200844-2a6bad2/marvel-linux-arm64"
    sha256 "ea4cdfd94f8dd86f577ffea97ca12c715228c7814c90ce42d51b259a88876acf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200844-2a6bad2/marvel-linux-amd64"
    sha256 "abdd32f8537997e4cdd2ba51549a7cde63db332ecfc6e5b386f94c4628c8cb75"
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
