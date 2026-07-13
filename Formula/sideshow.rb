class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260713.181713.eb2bbd5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-181713-eb2bbd5/sideshow-darwin-arm64"
    sha256 "58c347af99abd649e375450ed2a6623c4528618cd1ebaa4a859274a72d68d5bb"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-181713-eb2bbd5/sideshow-darwin-amd64"
    sha256 "5f00b0ea20b5affc483b57b8870d505f2ea44469fad97701b589ac2a66cad98a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-181713-eb2bbd5/sideshow-linux-amd64"
    sha256 "7c1603cd5586e01c979992f2115ca9df9ff384334c0512abe11c01bc831f5b3d"
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
