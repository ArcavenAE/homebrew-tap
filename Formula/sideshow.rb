class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261102.041017.f64af18"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-041017-f64af18/sideshow-darwin-arm64"
    sha256 "527c792ee7acb0b398c233bf02a2973efa9cd6b41929e0c1e52fe050664edb0b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-041017-f64af18/sideshow-darwin-amd64"
    sha256 "36a80da01e49885209404eb5efc55f51117207aa724018cf50a64fcb682f95dd"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-041017-f64af18/sideshow-linux-amd64"
    sha256 "5ca8362b7795355ac0c7fc724f4531fab5d497927c57c369561c38eb9d6b156b"
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
