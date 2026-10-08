class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.081719.1eae8ef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-081719-1eae8ef/sideshow-darwin-arm64"
    sha256 "ebfc36f957e6c00f95cbf61c779d7dd899f6d805010bfb039b3e122441b3522d"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-081719-1eae8ef/sideshow-darwin-amd64"
    sha256 "469cf1522168e4b7a7b278c240fa96460a252ea64bc0bf93a48cf559250d421b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-081719-1eae8ef/sideshow-linux-amd64"
    sha256 "ca79a37c6306b0495c505aa342dd46955f07f2cb5c397de33eec06e0f0587e02"
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
