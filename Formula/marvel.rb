class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.185447.25bdccf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-185447-25bdccf/marvel-darwin-arm64"
    sha256 "9bbee664e4b949abdf9b867631c906159422305f810d939e5b7059fabbaf4dbe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-185447-25bdccf/marvel-darwin-amd64"
    sha256 "a647863bff18704a37b9cf1d787ea840c7a5da22a4fc3f0e6b4d36137b8479f5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-185447-25bdccf/marvel-linux-arm64"
    sha256 "8cfe82683c7cf7d5955659d1daea3b7f827c0ba7d0e89c7ef719a2dbec2a72be"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-185447-25bdccf/marvel-linux-amd64"
    sha256 "231e4202ac28646612c188e33f6a850c3e8beb043592bd65ab983c75d47e40dc"
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
