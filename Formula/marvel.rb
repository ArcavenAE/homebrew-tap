class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.234830.51645fa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234830-51645fa/marvel-darwin-arm64"
    sha256 "cd551215a04a0ad79b540feb9a58c908d768979321cb3019bcae016eaf1970b5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234830-51645fa/marvel-darwin-amd64"
    sha256 "d3d90778dcba0dd4f7994bc65023efa086b752be440f5ba1b204660eda9a6108"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234830-51645fa/marvel-linux-arm64"
    sha256 "ff04964d267332af6d19f2cd7212de1b219f8b89a920053af5fc91f155ee54d7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234830-51645fa/marvel-linux-amd64"
    sha256 "6ba35d3dd8e68e0b3e2a58a7edbdd7c6703fecd28001ccabfc6a0d8fe064524c"
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
