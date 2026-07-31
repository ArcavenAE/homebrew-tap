class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.231913.214565a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-231913-214565a/sideshow-darwin-arm64"
    sha256 "ead7909008d8f3c523bfb624ff5db11def2e1bef14381ba9d6a2c27bbb91222a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-231913-214565a/sideshow-darwin-amd64"
    sha256 "4f4b1888523ca8401475ea3d222d02edb278482d991fcb960ba424d60d0e4f09"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-231913-214565a/sideshow-linux-amd64"
    sha256 "cfa5ca66924f4d49939b945d6f47e6a3bc169bdb7234c5061d8779c78f4eda81"
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
