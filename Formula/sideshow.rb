class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261026.004631.6fc03db"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261026-004631-6fc03db/sideshow-darwin-arm64"
    sha256 "7ed776c4c0f4de467a45ea02e7cf6b3673df477fe2015dd80f41ab410bcaa5ab"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261026-004631-6fc03db/sideshow-darwin-amd64"
    sha256 "003e90e3209482109cada821daf9de3305c2f840ce614eb61a8496d46e3a8bd6"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261026-004631-6fc03db/sideshow-linux-amd64"
    sha256 "62a4f783ff725bb99a0a3d08fa4da6d69afd9297473b1c4a3e33036c1a5a9b0c"
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
