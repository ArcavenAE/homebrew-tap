class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260712.203530.3cccebc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-203530-3cccebc/sideshow-darwin-arm64"
    sha256 "498df9550f6aad6afff34007f8f1fd1cf30a21a57b75396f034acab4813264e9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-203530-3cccebc/sideshow-darwin-amd64"
    sha256 "4e15527303a7f065c623638d93144120387909641ec738cf5102e58301c0a2ce"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-203530-3cccebc/sideshow-linux-amd64"
    sha256 "8a8f8b4b68eee6c6e57153c14a9a827be8721386ddc3d8ae4888b6c818ed4194"
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
