class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.053228.956effa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-053228-956effa/sideshow-darwin-arm64"
    sha256 "39769a1166c6af9a951de0527b03ce983b6e97f127a2c471c169ccf5398c69da"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-053228-956effa/sideshow-darwin-amd64"
    sha256 "cf5c4ba2ca09216d469d0d83b0ddbc6b36c517906a381f5086857cd7b7127ef1"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-053228-956effa/sideshow-linux-amd64"
    sha256 "53a75a793f0c2eacc4f88e5d96780ba902423e4a948a089f2cefdeeb64110b73"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
