class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.050407.a8ada18"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050407-a8ada18/marvel-darwin-arm64"
    sha256 "7c4e7bcab277919f9150a06ec3e86c2228b1fb3a9c439b8668b6e733f7884c33"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050407-a8ada18/marvel-darwin-amd64"
    sha256 "e609e0dd93a47f7f10806fc97bdad60f7cf3aff0c062a550004b95a130644469"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050407-a8ada18/marvel-linux-arm64"
    sha256 "aabfacf5bb4ac91b6473d2fe672556882f2cc866235e027bc9060357a42aa0a8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050407-a8ada18/marvel-linux-amd64"
    sha256 "d1e4c722a6f564d2d82cfb12ed5b1ab3202105ae446f5f41d4d44ee8dc7b0942"
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
