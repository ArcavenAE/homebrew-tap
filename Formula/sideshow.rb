class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260626.155546.cc780d4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260626-155546-cc780d4/sideshow-darwin-arm64"
    sha256 "a1b83120e857af237beca19ee9c0d1de0706ee960b6c2c0a69ae4a39d4e6326f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260626-155546-cc780d4/sideshow-darwin-amd64"
    sha256 "6f3cf7cbb1733024f439b5efe25a10d5a3bc516e958d6bb25ae3996db14c6f61"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260626-155546-cc780d4/sideshow-linux-amd64"
    sha256 "c0796c7cb1f2b3b8d9385880d9d2aa9afd3e43582077d2012602c4fbfff25b03"
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
