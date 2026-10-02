class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261002.202218.94ec507"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261002-202218-94ec507/threedoors-a-darwin-arm64"
    sha256 "83b2cc245598bafa0a6cfc563039cb321513e85e3c406639d131c882af083137"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261002-202218-94ec507/threedoors-a-darwin-amd64"
    sha256 "5a666088c4343d7932dd18e810a4cce6af4060e003dc5dcb69290369c852e719"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261002-202218-94ec507/threedoors-a-linux-amd64"
    sha256 "cefa15444a3ed8b0bf55432ab41da0c1708f50a93c02f534b9f3defbba28b7cc"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
