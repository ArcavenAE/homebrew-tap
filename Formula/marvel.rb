class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.155735.59e9e3c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-155735-59e9e3c/marvel-darwin-arm64"
    sha256 "caa30666e5d3f548e33bab4f61c6a9eaa7e5b85198cf692fdde61a39232c1ee0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-155735-59e9e3c/marvel-darwin-amd64"
    sha256 "4b1b2f8ac11ea71e47e37c2ef6f0e5e49101a95f088b1666f2506ade715629f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-155735-59e9e3c/marvel-linux-arm64"
    sha256 "a639e70aec8937825386d0956834c574da8d78ae23923f06c978c455ad2fd119"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-155735-59e9e3c/marvel-linux-amd64"
    sha256 "e86ef354a8436a5377049d9c0ad9e13ab0cfd6de49dc2ec2fb5ebb2db931c99a"
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
