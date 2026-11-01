class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.151348.1d64a82"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151348-1d64a82/marvel-darwin-arm64"
    sha256 "95f7ad05c22c4f2b8dd711346f8fa7e0cf3be7970b89874bf2cb29d1a356b210"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151348-1d64a82/marvel-darwin-amd64"
    sha256 "8a25abb4aa463f96ef3179a2a6a9bcea9c49226df7b5f2dc8a82cd9250beb87c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151348-1d64a82/marvel-linux-arm64"
    sha256 "68e3559e116b0f0f709f2cf1c94f6d1e913e90bde4423977ef0912a67aa753e6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151348-1d64a82/marvel-linux-amd64"
    sha256 "a0aafe5999ee17bc6a86029f4ad44b6b49cdbea2ef26bf85a0fb07c8191566a6"
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
