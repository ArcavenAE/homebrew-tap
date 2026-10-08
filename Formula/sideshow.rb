class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.124712.59a83fd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-124712-59a83fd/sideshow-darwin-arm64"
    sha256 "f70bdb5f9d019c2ce49dba305a3406e72c5037939c4c4d8c3c42de9fdfd8f577"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-124712-59a83fd/sideshow-darwin-amd64"
    sha256 "481027773c6dea2532dcccab03db67c8482ddbd45e01b5e96845b9f40a0935b5"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-124712-59a83fd/sideshow-linux-amd64"
    sha256 "a28dbe9ae30f2a86551f592294405eaf904b327fbeb4ad257b983530711ed070"
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
