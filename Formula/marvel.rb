class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.210820.db682c8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-210820-db682c8/marvel-darwin-arm64"
    sha256 "637f0cdf402c6dbb93fee5523ff93fbaaaa6c2fdc21db941243209879460da9f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-210820-db682c8/marvel-darwin-amd64"
    sha256 "820981a1ddf5b824fd785546961796e582722aff33b2dd1dad830a827137ddcb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-210820-db682c8/marvel-linux-arm64"
    sha256 "c31b8f99cb29eed45804d3d7782865e61926b173184c0471fa02b8798af697b3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-210820-db682c8/marvel-linux-amd64"
    sha256 "a2e1e1be988dd78a641fde3890504b85002d00afa98ae2c638d940a88d03198b"
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
