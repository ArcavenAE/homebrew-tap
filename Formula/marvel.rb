class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.222727.3283053"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222727-3283053/marvel-darwin-arm64"
    sha256 "ea948921f06856e00696c81b2306d650d55bae9e4cb137ace4145adb09e42c22"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222727-3283053/marvel-darwin-amd64"
    sha256 "480d8144b7b321ad785749b2b58166109e65ad7a8ea4d46acee0a839b5753719"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222727-3283053/marvel-linux-arm64"
    sha256 "459acfd75fb222e77f137d8f7e828516951b2b41007cd07fc81d760c568b40d1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222727-3283053/marvel-linux-amd64"
    sha256 "e6dc131323f4e99935c607f446abb1dd059205f75addc13417dd3b903af259b4"
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
