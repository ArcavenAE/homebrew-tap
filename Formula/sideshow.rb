class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.003008.6f92fa3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-003008-6f92fa3/sideshow-darwin-arm64"
    sha256 "d5877236c933d27baf3e89b15927cd89fd6232b07a6f6a1bdfbb17f8d591e597"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-003008-6f92fa3/sideshow-darwin-amd64"
    sha256 "62ae09eeb95c70adb4944e32de55040393b335f7649d81c023b2a3c2cc24fc56"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-003008-6f92fa3/sideshow-linux-amd64"
    sha256 "18f57de14e92dcb5d67cba1933d98006f4bb20d2e4d7502f1469c6001615abd4"
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
