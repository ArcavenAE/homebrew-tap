class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260419.001823.378080d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-001823-378080d/sideshow-darwin-arm64"
    sha256 "812125e755e8c0e36942e57be464254c79ba58e0fa77be35470cb01032f51678"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-001823-378080d/sideshow-darwin-amd64"
    sha256 "8a6c78bee02040c966dfccec8106a9923fc7df2424dd18de7921496aa9e93a7c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-001823-378080d/sideshow-linux-amd64"
    sha256 "5e72677ce212b80d0ac92dfc5b3b2f2c668ccc2aea1a1a867be64779bc496f74"
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
