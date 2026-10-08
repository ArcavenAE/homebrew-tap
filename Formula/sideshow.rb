class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.140221.6e19de4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-140221-6e19de4/sideshow-darwin-arm64"
    sha256 "e49365ae9f357573ce8fa241f22fab48e342f4446e2e1648d35d498d0817e624"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-140221-6e19de4/sideshow-darwin-amd64"
    sha256 "346e2481b3deaf107f602227b6a3e48c08327e3d76cb8257ef0b652d7a201d6e"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-140221-6e19de4/sideshow-linux-amd64"
    sha256 "4e3e706bcd398def88e7041e34d280d1ef7e68900a5c534ff88d077c1b4bca1a"
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
