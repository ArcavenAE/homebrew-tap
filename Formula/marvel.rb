class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.041959.989300e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-041959-989300e/marvel-darwin-arm64"
    sha256 "c4ebb39259fead56d19d4d5b3c06f0a83848f2b28a8a1164fffdc0dcb0931a17"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-041959-989300e/marvel-darwin-amd64"
    sha256 "efca39cc923baeb2084a01af3bffc2d3dcaeb011e1c5f3aaf9424bd0052dc123"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-041959-989300e/marvel-linux-arm64"
    sha256 "e3552658a2d1a250c67e5ef35cd43ff2b131ab1dccc9bf4cdef377085620dd07"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-041959-989300e/marvel-linux-amd64"
    sha256 "258323a643b86f3d2f3c9a03e64cca1a4a3ebadcf5f922a4413b3d496c4292df"
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
