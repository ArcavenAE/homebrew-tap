class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.190247.9dc347a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190247-9dc347a/marvel-darwin-arm64"
    sha256 "b378e20fd81a96f785e11863b17d646e3dce5a428fb9b3b3a94e3a6f4f7e5561"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190247-9dc347a/marvel-darwin-amd64"
    sha256 "75f4f4b947724ea5ac93bad438144bc5a0d2a9d3016f8bb557806919cdd52e63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190247-9dc347a/marvel-linux-arm64"
    sha256 "07e6183e024d93df324732ac878efad5a7dbdd1628ea711f9f6fbe81ed1e761e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190247-9dc347a/marvel-linux-amd64"
    sha256 "b341488775598f52ca6cb49240889b5d25e667afa4110b35c16ad97dec9295c2"
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
