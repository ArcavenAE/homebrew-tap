class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.034735.5798df3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-034735-5798df3/sideshow-darwin-arm64"
    sha256 "38d73bd4503f189c68c846bfe4d75653af10acf8e77913b01d0efa2bab584724"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-034735-5798df3/sideshow-darwin-amd64"
    sha256 "bca198440eaba3668b3bdc5d8d3f3dcccdb3ad170975c16ea925191d0904b6a5"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-034735-5798df3/sideshow-linux-amd64"
    sha256 "b00f45d1e3f7b6ca71adbe324785643d066fe557529ddc63e6cbac53af861fc4"
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
