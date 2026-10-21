class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.164444.80c1bc4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164444-80c1bc4/marvel-darwin-arm64"
    sha256 "a5aada0bb9dae9dce25dc9b123ed1f55cbaeadbb375b7cd65ea406bd0bff875e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164444-80c1bc4/marvel-darwin-amd64"
    sha256 "62a3c5c266700c25ec6e6378a26c086556be5aaf3553cbea013cee2566b8e918"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164444-80c1bc4/marvel-linux-arm64"
    sha256 "cd5788337e00f53f0d7dece487f46351a74b7276b5f651ed235f91db7d14a687"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164444-80c1bc4/marvel-linux-amd64"
    sha256 "b1d63b50e87f9df07eec6b5d383f11ffa59aa7aa80161c8c067233a6cb755771"
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
