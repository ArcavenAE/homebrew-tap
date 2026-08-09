class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.031156.a1d91f3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-031156-a1d91f3/marvel-darwin-arm64"
    sha256 "5e08aaecd3efdc746d3cbe486a1cf499529ab70d120e70b65b6872e189d6631c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-031156-a1d91f3/marvel-darwin-amd64"
    sha256 "85e4bfb8a774ac032e9fd8df9f9bf44e0277ece1c0f67f2feaf42a572fea388e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-031156-a1d91f3/marvel-linux-arm64"
    sha256 "c52d4185d5d303260c890cc5bbcf5a095875bfd4d45e9525ee375b8bdc686e39"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-031156-a1d91f3/marvel-linux-amd64"
    sha256 "05ce3a04761358c4c83f868fbf75927c25d1b317c152d5da9a42a84ece0058a1"
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
