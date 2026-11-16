class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.065713.0038a30"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065713-0038a30/marvel-darwin-arm64"
    sha256 "0b2390fa6954707076f4e2ef12ae2a36e8254b01a3af21a2df098d06316709ee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065713-0038a30/marvel-darwin-amd64"
    sha256 "74f671d7023960ef770ba9538510920dbcfe657aaae0c6f2390e0c55f6dd8e6c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065713-0038a30/marvel-linux-arm64"
    sha256 "3bcf425eb52f706f9285564b82e0be3d5ada86d3eb1e7edd454ac2217bf9c99e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065713-0038a30/marvel-linux-amd64"
    sha256 "18a6cd99d1d07c8ddd1c4fcb6df3fcde72b547666af7fb53b17f72dd9cd830a9"
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
