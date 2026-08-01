class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.045353.d4b43fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-045353-d4b43fb/sideshow-darwin-arm64"
    sha256 "4c9d6188e84df609d15e980dfba605724f9e0a8a5c7c59d678b2ea233b6da1af"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-045353-d4b43fb/sideshow-darwin-amd64"
    sha256 "e939b1a97bf108b87ba56840e30433dc1459c5fa263432f618623e619a50d50e"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-045353-d4b43fb/sideshow-linux-amd64"
    sha256 "b87865e34c03557048d2749a8f5344e26e8d874cdfca0ec26a165795b1c07328"
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
