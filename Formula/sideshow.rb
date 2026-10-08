class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.051756.2561d31"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051756-2561d31/sideshow-darwin-arm64"
    sha256 "337d11581d817346720d36ee26aab0774de4ee5f3874809c0dc84ce4d2400889"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051756-2561d31/sideshow-darwin-amd64"
    sha256 "4d0b6d139c48354f13a96e3513b786f77988b673c2c855791ee0c05986fd18dd"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051756-2561d31/sideshow-linux-amd64"
    sha256 "8438235bb895e93bd2d29b0c5f8283c8250ab4bb46d0450cb7435aec6655b23d"
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
