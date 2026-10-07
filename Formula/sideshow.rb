class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.073220.f1510ae"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-073220-f1510ae/sideshow-darwin-arm64"
    sha256 "20d4c0094d86e5d9b0cfcbb25f1a9443a77c3d95478ae0142767dfaf03d29f67"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-073220-f1510ae/sideshow-darwin-amd64"
    sha256 "c37025cba57a923d92090207c71fe3e22071441dfeb660be7064743f9195ec1e"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-073220-f1510ae/sideshow-linux-amd64"
    sha256 "e7d2771fa5c4a4b9ae052a813cfcd66ef1daa3b718fb517b449d3627c2f482c2"
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
