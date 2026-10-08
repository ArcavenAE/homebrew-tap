class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.203555.47f9beb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203555-47f9beb/marvel-darwin-arm64"
    sha256 "0cb1fa47e408806a9e2ccf37d08c935233d392c015ee06a7fbc79431cd606f85"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203555-47f9beb/marvel-darwin-amd64"
    sha256 "310b874c11fc13b43a5a228ecd113463dff0a9150308d7d3b66c92e9de2ec3a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203555-47f9beb/marvel-linux-arm64"
    sha256 "49d04b19cad89226a390a4fd3b5405fefec60ed8610ff2371fe1aa59252e9c6c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203555-47f9beb/marvel-linux-amd64"
    sha256 "8bbcde728e3c707430803ff33d4a5ec7f81bcfe89ae87dedebbfeb548d0d5fa4"
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
