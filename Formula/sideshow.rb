class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261021.011026.17a792c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011026-17a792c/sideshow-darwin-arm64"
    sha256 "64ca5f05372ee3407e3150baf694a627558c82cc0af9a50643ddc0d314e272f9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011026-17a792c/sideshow-darwin-amd64"
    sha256 "20f8c95ec31e2afe7cd96d3e943448b088c68a2af7db1609017960345ee4fdb7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011026-17a792c/sideshow-linux-amd64"
    sha256 "8722ee4a547b54aa721879b7f681b3cc0269b1df99312eab70a75094833b8bda"
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
