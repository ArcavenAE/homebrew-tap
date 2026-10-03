class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.023354.1cc0a84"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023354-1cc0a84/marvel-darwin-arm64"
    sha256 "eff83272fd987d3542d8a516f84204c0f5b08ae9f51147048fd4af4e9449e272"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023354-1cc0a84/marvel-darwin-amd64"
    sha256 "12b2e0bc42164cd73302e78b5aa0a3c83038c0f29b269e43fb15d011d7a41c8b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023354-1cc0a84/marvel-linux-arm64"
    sha256 "8c9f1ebb626f2afa1dc286f16e7239f8f1b4765660ff0b9b2bd6e76e45597265"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023354-1cc0a84/marvel-linux-amd64"
    sha256 "bcdf23774142d792d29e0e0e6d1773411eea270acb4f58214ed979202d8f8c2d"
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
