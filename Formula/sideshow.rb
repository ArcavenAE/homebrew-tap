class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.070308.6dc5d2c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-070308-6dc5d2c/sideshow-darwin-arm64"
    sha256 "604af3c958155960649c98ed742bf9bce26207a391de8fc86df1e130f97f5c9a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-070308-6dc5d2c/sideshow-darwin-amd64"
    sha256 "1744c899ecbf7148e7c7e9ee61e8e9f9e5dc5decea45bffe36fd02ff0e8f3720"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-070308-6dc5d2c/sideshow-linux-amd64"
    sha256 "9f10bd34b3357db4a8e07c338c0dbd8f14191756e4730e51d564cb88e80be6b2"
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
