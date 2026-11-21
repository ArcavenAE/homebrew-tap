class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261121.005240.2df155b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-005240-2df155b/marvel-darwin-arm64"
    sha256 "d51d688f5cfd926f245b733d790ae3a11f9ae8d0752b07a06a62bccd927f9515"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-005240-2df155b/marvel-darwin-amd64"
    sha256 "ecd908f33e5a076dd89ade7692d919bf59d0f71a4552fb0ab2f2cbab75d72fed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-005240-2df155b/marvel-linux-arm64"
    sha256 "591e285699e3420a23c616a4fbc167727dd800f01dc01f32436fc38cb149d5f0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-005240-2df155b/marvel-linux-amd64"
    sha256 "8c4fccc927ff17446adc9ff7b187662f99d49453b13f610328557e4139ff54c2"
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
