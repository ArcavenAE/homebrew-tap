class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.170913.fce786c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-170913-fce786c/marvel-darwin-arm64"
    sha256 "668665c5f0bf350a4d804f49c3a25071e5b0e3506598e4610ac542c588b36e32"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-170913-fce786c/marvel-darwin-amd64"
    sha256 "e17363dc15ed0d30ae8881df833825fd32531ebf32a4c24972c30e5afec4c01f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-170913-fce786c/marvel-linux-arm64"
    sha256 "001090d0bd0a29d8bd9ad99993aaa822b746e94d2aba8cb813547965ee84e5a6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-170913-fce786c/marvel-linux-amd64"
    sha256 "3504c0e147cf821f2878fc8522f3a858a172eced87736ffd9eb00d3bab311f43"
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
