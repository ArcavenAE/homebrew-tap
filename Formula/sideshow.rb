class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260426.223151.1e4d0e8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223151-1e4d0e8/sideshow-darwin-arm64"
    sha256 "ff91cf522b81408b9635b596b9ff4bcf53f34a65ccc2dec10e8c54396f75a0a0"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223151-1e4d0e8/sideshow-darwin-amd64"
    sha256 "13a4053123b4e75b4ac80af6f831c88034d9120a52d331d58e19acf7ee16e9d9"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223151-1e4d0e8/sideshow-linux-amd64"
    sha256 "cd1c5a37a6ae5620e53fa0427ce976544aa2b851203e20160492a9a7bf80e39f"
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
