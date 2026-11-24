class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.195212.a44309b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-195212-a44309b/marvel-darwin-arm64"
    sha256 "2b4fa253d27c59caca84fd21b0cc6e25d3f074cedec412fb7b630e57ee2c8c47"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-195212-a44309b/marvel-darwin-amd64"
    sha256 "935f72fc9987e7461ddc5a918c42bd3fe5ac1b926e6a4c401482fd49e69a4117"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-195212-a44309b/marvel-linux-arm64"
    sha256 "35462cab1b725619f0ac6553d9336dbb84bc6bee3aaa23c4fd9c6bdcdfecb568"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-195212-a44309b/marvel-linux-amd64"
    sha256 "762ef18c5ce977a0ab483d9afc29c92fb147b92b6ff67f75efb46ac681e96f77"
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
