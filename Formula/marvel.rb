class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.231325.2798abb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231325-2798abb/marvel-darwin-arm64"
    sha256 "9f71a071f2dabc6b6718a8fbdcbf2800bf8a9fba6745f1863e67348f27979837"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231325-2798abb/marvel-darwin-amd64"
    sha256 "9dd89aa1e11bebbec53c3514d3508ea8cc6cda22c04e7b763d34b1fbe07cdf67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231325-2798abb/marvel-linux-arm64"
    sha256 "0c6f59c1a9124ac285f1916caa66c3ee3b87e68c1a1465e87d28ac8c4d428931"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231325-2798abb/marvel-linux-amd64"
    sha256 "86aca56e7ef331d4357c918515f4e7b7efc4d36a263463e862781491643ab0ab"
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
