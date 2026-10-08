class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.064718.efc8392"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-064718-efc8392/sideshow-darwin-arm64"
    sha256 "06a33b8190415e6ed08bb8210dbfe3ec95cd8bd3deca6d05ea1b1c8418246bcc"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-064718-efc8392/sideshow-darwin-amd64"
    sha256 "73fc4a4e8b50b316d65b005eeec56f6499748c4d9ea1ac57f0e1dd43ec1a167b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-064718-efc8392/sideshow-linux-amd64"
    sha256 "06cd774165a6c9aab86ee3742698c9f6f0fa203fdd8c3a2e8166fd0d62353232"
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
