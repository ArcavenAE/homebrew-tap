class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.061541.67b96b5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-061541-67b96b5/marvel-darwin-arm64"
    sha256 "91a6e4e212c4c16204e8f67cd7d45ba8c13f9a92655dad7e1ac3f9850fc00753"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-061541-67b96b5/marvel-darwin-amd64"
    sha256 "64afdf50c6499eb234472ff52b53e4aa11a5119046ecd2ea920db6ea360170d8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-061541-67b96b5/marvel-linux-arm64"
    sha256 "7a6c40a0671d3245a0fc42b4ae4ae5955c31f4751c2a5fca83f1f9ba8dc37c44"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-061541-67b96b5/marvel-linux-amd64"
    sha256 "24b2844328b65c847efd133d2363105b5101626170b687fecfc0a32e58a81475"
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
