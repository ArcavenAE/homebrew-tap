class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.111718.6fdd2c8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-111718-6fdd2c8/sideshow-darwin-arm64"
    sha256 "c4e2f7538b899d71f348721cc0ad551a8ff2fba9d88143429a6fec104814f7e4"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-111718-6fdd2c8/sideshow-darwin-amd64"
    sha256 "0e8d8eabca0792713f9cf7432d1d0db7caac19f791c0f013d24cac2521bba9db"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-111718-6fdd2c8/sideshow-linux-amd64"
    sha256 "b80685f9929d581506510a75f42d8d040809a79e8c4f6910eb3519a1710cc90f"
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
