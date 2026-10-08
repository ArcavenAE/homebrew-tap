class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.131724.c7b6113"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-131724-c7b6113/sideshow-darwin-arm64"
    sha256 "d6df58e34b86799251389497570d49b06661f072c9dd63e48161924eed6ac6bf"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-131724-c7b6113/sideshow-darwin-amd64"
    sha256 "a0a82259e13c597f56fca44f8c8c91fb945f259bbb469e2312c43a6c2aedee28"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-131724-c7b6113/sideshow-linux-amd64"
    sha256 "cf76c34d60f3feb1fe1b5453c49a0c0bd56366ec8c6e5f02fc08ad46d7c8893e"
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
