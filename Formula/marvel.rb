class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260826.040356.1443a56"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040356-1443a56/marvel-darwin-arm64"
    sha256 "e36545c51e2684128d2e2412b59e2908e1898cde6469ce4b9409fe09e0d0361b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040356-1443a56/marvel-darwin-amd64"
    sha256 "a2e7369bed3f823371767d28ad2ab64c8623febae7c494b923c2fcba85b659d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040356-1443a56/marvel-linux-arm64"
    sha256 "b6fda2a65ce21dc2f48610c091dbe64b9b1023c91f5736898fecf9f1a35aefdc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040356-1443a56/marvel-linux-amd64"
    sha256 "ee40e70bd6145c8adb791404d33e26f8eeaf08af9ae1d872cbf8a7bd2944dcc9"
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
