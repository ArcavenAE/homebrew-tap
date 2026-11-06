class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.082654.d9c2ad0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-082654-d9c2ad0/marvel-darwin-arm64"
    sha256 "2bb03414c45d255cfeddbcfee030e87272c6efd6645e3d57559419d6287472cc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-082654-d9c2ad0/marvel-darwin-amd64"
    sha256 "37cb58b6d7245407a2f20b50820e0a144718a8cbe6a364d02e9fbb6939984b09"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-082654-d9c2ad0/marvel-linux-arm64"
    sha256 "d4546d15f443287eb5bdb66f6b8fdf88bcde80244aa08a154899718669763db2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-082654-d9c2ad0/marvel-linux-amd64"
    sha256 "38945ee26037ca7349dd399c1b9083f48b32e2be99bfdac9613950466f1fe426"
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
