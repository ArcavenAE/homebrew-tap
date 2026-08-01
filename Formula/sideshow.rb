class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.040642.a1962f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-040642-a1962f7/sideshow-darwin-arm64"
    sha256 "e9bdadeb46fd9e17841bde47c369e25b8ce0f0d1c83599115ef8cff0dd5c3467"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-040642-a1962f7/sideshow-darwin-amd64"
    sha256 "a4ca541c519937c06daee639dcfa4098259896f1a696c66965ec8bbd37e65c9d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-040642-a1962f7/sideshow-linux-amd64"
    sha256 "c507d0b6bfeb85b7d1a3ce828f52b408ebe7877b09fc9a65146fc1b6521427c3"
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
