class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.053253.24c238d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053253-24c238d/sideshow-darwin-arm64"
    sha256 "adb38e741fb4ceaa5fa9c3025b585fac9b3c01fcb619a8fe6bcf2c3918d63197"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053253-24c238d/sideshow-darwin-amd64"
    sha256 "a0413e6f6c3dba879987a466dbdc9bade6fa380bd824f252fdf88c3400e71c59"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053253-24c238d/sideshow-linux-amd64"
    sha256 "7632e7c01986236d5db55c6f3f7d2ccfd6c38158d533970cce0a4562f367a58e"
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
