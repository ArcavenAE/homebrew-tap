class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.064733.ee33454"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-064733-ee33454/sideshow-darwin-arm64"
    sha256 "926ee6aa4a715c1f2947abebdfe045f70880d7654faa85151b34e944cbff32b5"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-064733-ee33454/sideshow-darwin-amd64"
    sha256 "2dcbb8fe2e870940a6fcf89cd542c466ad315bdc642c94aed3dabed7eb059c8d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-064733-ee33454/sideshow-linux-amd64"
    sha256 "f74b30f380aced04fe89f8f0b8665c6683ddda6866d5021bb9b37bd4c116daea"
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
