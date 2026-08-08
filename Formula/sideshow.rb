class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260808.194115.24f1f7b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260808-194115-24f1f7b/sideshow-darwin-arm64"
    sha256 "ecac45441f53af2d0e9e0c25348bfd76ce27d95675fa0e88e0055f6ee6bcceea"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260808-194115-24f1f7b/sideshow-darwin-amd64"
    sha256 "b16f0b52e5b73f03e9e7ce30a3c4699e805e5a53bb4f4c5711214d6bbb7d712b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260808-194115-24f1f7b/sideshow-linux-amd64"
    sha256 "ff42848302d536dc5294dc91d5fa943b64992d8a3eef97a44d3f8a3beaa55230"
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
