class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.155111.493909e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155111-493909e/marvel-darwin-arm64"
    sha256 "609c25739528a4a225f16ae50cd3cfaae9d9695107b7596601795b6824f05917"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155111-493909e/marvel-darwin-amd64"
    sha256 "9ba8e7b49d45637e56c80b03bdce503912529863918e9fc7d19342d856e7048d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155111-493909e/marvel-linux-arm64"
    sha256 "48f0353920bb1276e509ab19a523457571e702860f4cd7e6215ae2b82eae5d74"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155111-493909e/marvel-linux-amd64"
    sha256 "a6cf9d5e30ef0d5c82c208974ca1187cfde044a3f07c14815261ed1ceb5c289d"
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
