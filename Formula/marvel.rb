class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.074134.9526aba"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-074134-9526aba/marvel-darwin-arm64"
    sha256 "fce9e7d9910577703d15683a7af9e61a4a4b0aef40dbedd70064e24ef8eea0e0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-074134-9526aba/marvel-darwin-amd64"
    sha256 "0107dd530c79160508bf66bff587f9356ff5201b857d9e8f34aaf05d7ff3de15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-074134-9526aba/marvel-linux-arm64"
    sha256 "9a64f7f980d90db9b123b43ef7263f3d8511e2d7f3ab5d72b8d6e159ef819939"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-074134-9526aba/marvel-linux-amd64"
    sha256 "c7ddbd0730f36c9b5ec6b38f4c95e2efbb8e121009bd73694ec2aa8353843e37"
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
