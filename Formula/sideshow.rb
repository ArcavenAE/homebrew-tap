class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.011827.1771a16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-011827-1771a16/sideshow-darwin-arm64"
    sha256 "c0b501e8f6ab5bfd1bfd410008b75a57dc6eb0125a8552f72e06e71a9a300b82"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-011827-1771a16/sideshow-darwin-amd64"
    sha256 "3883148afe97bceb31726f3cefd5e6379cf987015009f4fac03604c6daec0efb"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-011827-1771a16/sideshow-linux-amd64"
    sha256 "38469fcd26dc0f9f456c4dbf7d5db85e291f391eaae534808cdc81db8a0a4d02"
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
