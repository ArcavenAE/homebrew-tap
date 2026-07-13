class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260713.015031.e3409a6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-015031-e3409a6/sideshow-darwin-arm64"
    sha256 "2bd4383a8ad9facaffed1856a3c248bb256bac6488d35f39765c2b0bfda6eb54"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-015031-e3409a6/sideshow-darwin-amd64"
    sha256 "faedfbf12b887fad005edc9094c91d155f93b441e760ad094dcd2c951725c9b5"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-015031-e3409a6/sideshow-linux-amd64"
    sha256 "5010b1e75576099da0b6c4f882d44781bfdec2e7d51e01c91abd532e77bf5b4e"
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
