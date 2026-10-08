class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.103216.bafee50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-103216-bafee50/sideshow-darwin-arm64"
    sha256 "7928eba2453cdbc753db9a184cdd1b9b12ef3e78c8cbf3090334148b1d423b21"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-103216-bafee50/sideshow-darwin-amd64"
    sha256 "50254a5e46624a0b4193e8f62e340967c2e463271cee171dc5da2a533524685e"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-103216-bafee50/sideshow-linux-amd64"
    sha256 "0b41c9af4def022d48265e8b01ac718b454b3e4fb4da36e04a4c95d935703d14"
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
