class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.061716.308373d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-061716-308373d/sideshow-darwin-arm64"
    sha256 "3089e05c39983b8cc5540b90fd719562fc614faaf7b5a9a16ea8907b027759b2"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-061716-308373d/sideshow-darwin-amd64"
    sha256 "f09016fb3fe0718c75499adccd772564e603adc4c071a19c3ec399b7f6d80d58"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-061716-308373d/sideshow-linux-amd64"
    sha256 "564262876a2d68d7dc4765e7a1f7b70bda7283cf8afc75caf34d01e6478e5175"
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
