class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.085416.f71cc90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-085416-f71cc90/marvel-darwin-arm64"
    sha256 "e4eb6603f34008be8079e494f512ca4192ca6c59fa8ac5aaeb8e09b27b331115"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-085416-f71cc90/marvel-darwin-amd64"
    sha256 "8abd8cee660882a094562d1a91b63f029bef8e73920a583e0d127bf11f98bc30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-085416-f71cc90/marvel-linux-arm64"
    sha256 "1a05bb59c12d28215a45f4203b387057f9cdb93bd292574063ae17729857888e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-085416-f71cc90/marvel-linux-amd64"
    sha256 "c35f621baae4510b6fcbb265d09e32b35210eb0c11b9992be70f5a573ab75986"
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
