class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261005.221923.1468e55"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-221923-1468e55/marvel-darwin-arm64"
    sha256 "af3e4f79f7012548dee4ccd27cf35cbc514d4bbdfaa5219b6b7a7cd02ee7a3ad"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-221923-1468e55/marvel-darwin-amd64"
    sha256 "a7ce9e7a86d8ac75c1a654304737270fcb72a909469ad6bb6c5d10b0fdb627f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-221923-1468e55/marvel-linux-arm64"
    sha256 "044d5309c794b4fa23bbeb39152335aa7290ee8d7c8e73b61efdb9823603bf79"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-221923-1468e55/marvel-linux-amd64"
    sha256 "0e59a048163d99d6dca74550cfbeb247daec14ab7a76775af5e77298361e1c63"
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
