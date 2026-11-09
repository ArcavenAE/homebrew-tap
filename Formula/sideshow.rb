class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261109.184652.ef48780"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261109-184652-ef48780/sideshow-darwin-arm64"
    sha256 "ea53978cbc58f949442cb1567e7833598fdb0fc733653dc9f04d46b5c66e9e89"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261109-184652-ef48780/sideshow-darwin-amd64"
    sha256 "e777f83086db1ab83924525dc633ee60e0daa30c287c56bd8a72be1c7b859664"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261109-184652-ef48780/sideshow-linux-amd64"
    sha256 "4b4afa3cdc8b408942ea6a62ccc141bcd064bf219706db4d6684c94ac89136d0"
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
