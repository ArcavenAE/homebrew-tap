class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.061720.0ebcf28"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-061720-0ebcf28/sideshow-darwin-arm64"
    sha256 "9653cf0d4db6d916b6930406a10254c64f0a0b52e2fa8ac0f90da0455b6c55fc"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-061720-0ebcf28/sideshow-darwin-amd64"
    sha256 "0ba4fb5bd410dffe03775eaa514b875f91b2c07c737e7d0f01b131b8abfa21dc"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-061720-0ebcf28/sideshow-linux-amd64"
    sha256 "aba01d8c95ded0fa82dd445e3ea20a3b8587c6085fb18b417eacb06a82c1ebd4"
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
