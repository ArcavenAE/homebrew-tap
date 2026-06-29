class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260629.173126.325bde4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173126-325bde4/marvel-darwin-arm64"
    sha256 "da6b976c321b2a48cbab13e0d0a8fbce744742682027bc57418565008860b71c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173126-325bde4/marvel-darwin-amd64"
    sha256 "b835af6a8f07289bc59f7c31a39e066c6aa513b5021801829c4bd94e9658e93e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173126-325bde4/marvel-linux-arm64"
    sha256 "6ee012b8560c14adb7d76e23b075f603adfeb9d2da75ccfa28f64f97456b9c1e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173126-325bde4/marvel-linux-amd64"
    sha256 "10afaad9d603cf11ff8c750d2d57cf1570ecc02d036e4520b85d11fa5f7d2506"
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
