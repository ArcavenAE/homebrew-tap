class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.001753.2a8c6fc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-001753-2a8c6fc/marvel-darwin-arm64"
    sha256 "5e943a388467f49535c8c8eff354ff008bbc5f94fc5c8b4398f43eb2097cbbd2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-001753-2a8c6fc/marvel-darwin-amd64"
    sha256 "08a4ae972c221358599f9930ba47b648ccabab8c97ad499634d2ce53e9911525"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-001753-2a8c6fc/marvel-linux-arm64"
    sha256 "0aa4ceea2435f3ca2ca1720df33bb8b30e9ecf2cfe583dff4bbc5c2986766252"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-001753-2a8c6fc/marvel-linux-amd64"
    sha256 "312ac4d2043b8123ad8641775384509acb0b9f10390f517a90604b7d9c8bdb4a"
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
