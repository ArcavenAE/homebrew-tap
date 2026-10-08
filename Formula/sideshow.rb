class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.121708.33fa181"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-121708-33fa181/sideshow-darwin-arm64"
    sha256 "e87338511d62df2fc09223186570bea75c84e165823c2d8cd3e29a16eaeec2f0"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-121708-33fa181/sideshow-darwin-amd64"
    sha256 "01fb90b308875fac6a8b67d2f8bb76c67dd26377059ddd9abf6e892c892d885c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-121708-33fa181/sideshow-linux-amd64"
    sha256 "042d80a0a3839d356b88a1f2dc8d94062c1edfd9943fae387a7fe19434bd3a1d"
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
