class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.200506.faf6776"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200506-faf6776/marvel-darwin-arm64"
    sha256 "bc863c0e1f45cd96555c07281b6955847a4f71253dd1735f206dd1f533e8eb2c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200506-faf6776/marvel-darwin-amd64"
    sha256 "a28fed567451d7b63830b7379ab1da1894caf2aab10d3c273590652c67b94559"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200506-faf6776/marvel-linux-arm64"
    sha256 "fe51712802bf1b750c2b3863fb7de45e4e5cc1c622575d67e52d4bb7391a5486"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-200506-faf6776/marvel-linux-amd64"
    sha256 "1db054d9dee65d63b99d84c85bdd4db343b481bffdff1b6e4aba8e71e0461cf8"
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
