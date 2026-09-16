class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.101426.603f8b1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101426-603f8b1/marvel-darwin-arm64"
    sha256 "bfa65d52d9b875c96c034b4486db34bf4a56b68bfdf241babdf7465558fdb4de"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101426-603f8b1/marvel-darwin-amd64"
    sha256 "0849c5f5e1c999ebe284389e7ef4e7b21fa0f9050ff084e9a0726b8ae7aed8bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101426-603f8b1/marvel-linux-arm64"
    sha256 "606269a0a49d45c74c445303cf3e7a556418f82a871cb3ebccf8ee1257d9a358"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101426-603f8b1/marvel-linux-amd64"
    sha256 "ea337633a750d6dc625049b0df5e97bd9241f710d2c133e0fb38621a7c1d5169"
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
