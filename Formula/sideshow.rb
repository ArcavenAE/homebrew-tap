class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.031944.e536199"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-031944-e536199/sideshow-darwin-arm64"
    sha256 "4ec7f9399aa2adc05b1d23b0e7f866aea999c0c0ee63a7786c305e6469657ac1"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-031944-e536199/sideshow-darwin-amd64"
    sha256 "7a36de18a227a25448dfab2db9ec949ee234a65335e640b9eb2f794da45afa09"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-031944-e536199/sideshow-linux-amd64"
    sha256 "0bc00dcedfdf22449ed73c4ee7cbcf70d27c2ef8ab29f385db6c91d53f22a425"
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
