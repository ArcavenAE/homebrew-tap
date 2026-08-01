class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.235636.3f006ee"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-235636-3f006ee/marvel-darwin-arm64"
    sha256 "08dc2399177a1efb6093903767fea5274597249012c5965ef84e1aff90fce140"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-235636-3f006ee/marvel-darwin-amd64"
    sha256 "7b8855c7a9f0109cecefad385b2b735da1c88d18d2c2f7b90e9ba75d614ef879"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-235636-3f006ee/marvel-linux-arm64"
    sha256 "2f971190a1092be1250884ea71422ed6fb2b5ee3b89df9efbb5940ca0ca879f0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-235636-3f006ee/marvel-linux-amd64"
    sha256 "0801f1e656791f954c77ba875ae72515211c5da81007cb39b7fd11b6a3fb5a10"
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
