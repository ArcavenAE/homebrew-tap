class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.044644.08dc6bb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-044644-08dc6bb/sideshow-darwin-arm64"
    sha256 "ecf07e9463157a77c8abe16c7a6aa7cd3107a01a65d7356d2343851236ef56e0"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-044644-08dc6bb/sideshow-darwin-amd64"
    sha256 "71caa8d8e9de3638f2373e5f514be016ed4b4335a18e00a737751740f6adfdc7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-044644-08dc6bb/sideshow-linux-amd64"
    sha256 "9ce3d7bdfe63715539f38cb0fbd6aa49cc6a7f3f4d08480718564853091e994d"
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
