class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.151533.c0dd5f2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151533-c0dd5f2/marvel-darwin-arm64"
    sha256 "29e33c2849d0cd33f4c8c9a324dbc946abceb0e822bee4ba3d94eb84485ed61a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151533-c0dd5f2/marvel-darwin-amd64"
    sha256 "41730bbad80ee5d5b6736fcb9ec1842eb41dff3236254d6da79861f7b751035f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151533-c0dd5f2/marvel-linux-arm64"
    sha256 "14d2a8b0e7dbe8e9c8d163cad8527b6d65b867311037b7738e386ee881d13ed4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-151533-c0dd5f2/marvel-linux-amd64"
    sha256 "436ca95137bc2547bcd870107e8894a6cbd53482156f4f27297b7f288ac47dfc"
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
