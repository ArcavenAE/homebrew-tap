class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.063151.d045cd5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063151-d045cd5/marvel-darwin-arm64"
    sha256 "53a1188d0111ea68ea2ac29d1b60c03a29a01d688dd7c8585b8706b3a0a4c668"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063151-d045cd5/marvel-darwin-amd64"
    sha256 "ec4272e2a990a464257579fdc4d041b6deed1a4a4589b09c04fba8442681e911"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063151-d045cd5/marvel-linux-arm64"
    sha256 "82757f22cda67c0aa9ed9d3f4ac14bf734c9aa2b19adb61c811b8aa1a60b3307"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-063151-d045cd5/marvel-linux-amd64"
    sha256 "0b5c86756d2d0dea01decaa6839f0b2c9a9952aa713dc64eba93d64876dd2bb0"
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
