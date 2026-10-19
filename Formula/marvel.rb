class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.174939.95238b4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-174939-95238b4/marvel-darwin-arm64"
    sha256 "f6da44b556f8a783bb2c6dce6b14679d391efbfd9b622b0e38e7880e11f32dfc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-174939-95238b4/marvel-darwin-amd64"
    sha256 "e9cef9dee6010e4c9a578e9f6366a15d5be72a1220f73c04c392b3374537eb92"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-174939-95238b4/marvel-linux-arm64"
    sha256 "3acfcca870069f03d37a148400cd7a579124f029b31a352d5341e998a34042b3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-174939-95238b4/marvel-linux-amd64"
    sha256 "62dcfc8d6a80a2cd2762f61d0b1d33da4c1851b5adfa2aea63b84aad7a6f7c9f"
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
