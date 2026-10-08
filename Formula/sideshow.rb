class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.091724.7b8cb48"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-091724-7b8cb48/sideshow-darwin-arm64"
    sha256 "02e4ffc31ffd9379239e94e02e311cc977a4c61b7b53965193524cb8a2d41dc8"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-091724-7b8cb48/sideshow-darwin-amd64"
    sha256 "1f465ea52ffcc15669f980bcf332ef97cb4d898ffca98fc8db86e65851811825"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-091724-7b8cb48/sideshow-linux-amd64"
    sha256 "e2059c9e314e2c5d2600804a870bec06b2683692ac51e9984a0295db66d4f32c"
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
