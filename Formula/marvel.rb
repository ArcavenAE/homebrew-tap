class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.222657.ce9fa81"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222657-ce9fa81/marvel-darwin-arm64"
    sha256 "6d8627925ad9d5c83b7e61cf0496a1b8bf722e258c22de91af37dc7e6d0bf2a2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222657-ce9fa81/marvel-darwin-amd64"
    sha256 "4c556465afd926a2c93efe30ac9ad9a499a1ce3b2ad658b6cf7e10fe3a00dbca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222657-ce9fa81/marvel-linux-arm64"
    sha256 "1e5c2c3e012c54678fc5c428873b2f222fcf438915e02787832cf246c9bdf785"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222657-ce9fa81/marvel-linux-amd64"
    sha256 "5298d41f4b9edf9d070a2f7de10fe2c7c4ed6e73f7227d96fc7378edad361da8"
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
