class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.064145.16add0c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064145-16add0c/marvel-darwin-arm64"
    sha256 "fd876b42bcd270bdff997700072c9e0f91ed8af94248a5bfa77031c82f0ff766"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064145-16add0c/marvel-darwin-amd64"
    sha256 "351502e0d2ed1acc4562b92fb1c967b59881e4db8d6a782f7aec9e6f3602c81b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064145-16add0c/marvel-linux-arm64"
    sha256 "ce6cc46a3a601457e33022017d3a14a11e79c07b792f11f4faf9b4760ecc4a49"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064145-16add0c/marvel-linux-amd64"
    sha256 "74bd82636df351a1d35f598f0bd11564a7567395a7c7bce890d64582ef8bcd43"
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
