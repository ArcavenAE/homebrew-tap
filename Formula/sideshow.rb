class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260513.122023.4cc1807"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-122023-4cc1807/sideshow-darwin-arm64"
    sha256 "2b779ba733048509a0560b4ee646af475a82ffe6dff4a7d0d3fa698deda7c39d"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-122023-4cc1807/sideshow-darwin-amd64"
    sha256 "3b8a4eb5861d419e676726123f91ce12abd4c9329e7b57882c2c8a876508c2e7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-122023-4cc1807/sideshow-linux-amd64"
    sha256 "536f8dc7a74afdcfdc083558d178538b33bd18ccb25b0cdc253074a87f9a9ea7"
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
