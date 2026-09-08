class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260908.215621.450692a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-215621-450692a/sideshow-darwin-arm64"
    sha256 "0e7fe3be1fcbbb554b56c885093442b31fc968f30bffbc98d965921179655ebf"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-215621-450692a/sideshow-darwin-amd64"
    sha256 "bd799ee94475a4159b3a718dd8b8ec861dda4b06bdd97c34ce93b79fbc1afa4b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-215621-450692a/sideshow-linux-amd64"
    sha256 "596e1b02191387983c27442846272eb7d4734e421035614ac27c751f5ea7824c"
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
