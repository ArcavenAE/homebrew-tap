class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.063229.8c37617"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-063229-8c37617/sideshow-darwin-arm64"
    sha256 "f7f8b4b38081a156765beb5c040275193ea6a7ef0d499b583e8127eaffb25bbe"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-063229-8c37617/sideshow-darwin-amd64"
    sha256 "89f43d349f3dfecc56a3ea6a800ec27dda491a3ffc31068873d92453652ca212"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-063229-8c37617/sideshow-linux-amd64"
    sha256 "765a910cb4b9c2c124afc106fe76e16d1be7275b4167b164c72044dbd1715983"
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
