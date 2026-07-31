class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.223828.b9275cb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-223828-b9275cb/sideshow-darwin-arm64"
    sha256 "5fc5e76e43abc3a9482fa894ba3b5f67d030cff39aa24cc93b9cf39073a328bc"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-223828-b9275cb/sideshow-darwin-amd64"
    sha256 "05c240072341d7a1fc328e7de7871863a906f7ec4fa3342c144873b48b424419"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-223828-b9275cb/sideshow-linux-amd64"
    sha256 "64d144e1d73f7585fc003026ee1aec67b714c8e13b644ef91187a9d1e2d83149"
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
