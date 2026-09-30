class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.223201.0e05ab5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-223201-0e05ab5/marvel-darwin-arm64"
    sha256 "db51f84ba99bfafcbf192aef1842d2634a08e0eaedebd00a3db422c5f834411f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-223201-0e05ab5/marvel-darwin-amd64"
    sha256 "5d7bf90e31637bd660a133a64089e0afc58d5289c019246f67bd2b33163fd0cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-223201-0e05ab5/marvel-linux-arm64"
    sha256 "48a784f032d6333b863babd74c52606916066ab27b4c53f54adc357f56c953cc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-223201-0e05ab5/marvel-linux-amd64"
    sha256 "9e2be295d17bf600edf54d1f6f6eb14cde1f8429f3b35640174b986d9eebd3c2"
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
