class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.041732.900a605"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-041732-900a605/sideshow-darwin-arm64"
    sha256 "76a84a050cf633d485bdcd6dac5868434cf0088b6a376135a699c36485ee4118"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-041732-900a605/sideshow-darwin-amd64"
    sha256 "ca3a2492e776e69a4e7be0d26ab0b8eb9c886d8a4278c12afefe9918b4b41d90"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-041732-900a605/sideshow-linux-amd64"
    sha256 "fd54af0668d4e91524128451e20a4a9384276f2485ce5fb4aaa414a15597274a"
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
