class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260630.020225.95ba5c6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260630-020225-95ba5c6/sideshow-darwin-arm64"
    sha256 "52c8ad02c972c3e03a22043b7262707ef887098eb154b77bea54b32a38c36897"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260630-020225-95ba5c6/sideshow-darwin-amd64"
    sha256 "dde9a32fccee6e9c48bc09ce9d1acc5ae1ae75c9cfeff409caf404ca71fe1ed6"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260630-020225-95ba5c6/sideshow-linux-amd64"
    sha256 "2386c734ea4bc58d873c8c000603ff39d7a166ed5932d5125b14fcfc17f054c9"
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
