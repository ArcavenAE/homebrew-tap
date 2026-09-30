class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260930.135322.1b5d716"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260930-135322-1b5d716/sideshow-darwin-arm64"
    sha256 "c5e2d7abc4011294a98747db9617b16768c4421c78b080c6044b9379e2b6b300"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260930-135322-1b5d716/sideshow-darwin-amd64"
    sha256 "46d3ae64e3897d95a5326d1eb7e9fed752ee01bfc421294d95edf4899d416d20"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260930-135322-1b5d716/sideshow-linux-amd64"
    sha256 "298c0c49b3918026a0396a4fcaccdf6052c95c4ebdc99b21739a6973f5418cd1"
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
