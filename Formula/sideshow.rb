class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.221110.014527f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-221110-014527f/sideshow-darwin-arm64"
    sha256 "785e436713a15ffa08976fab3ec27dc329bc1c801b15b69b8639d40facf19ded"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-221110-014527f/sideshow-darwin-amd64"
    sha256 "bb01e81f26262af90d3f5b48d7432dcdf0ef8b78720feb78c194a1728c4284e4"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-221110-014527f/sideshow-linux-amd64"
    sha256 "eed1716c70a94b2b39fb1cad8ab7375b1309a150326d7e5016960f9c2dd6e508"
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
