class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.053227.d01d959"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053227-d01d959/sideshow-darwin-arm64"
    sha256 "a98f1fd818622296c083e636e575f467443e47e050c026c16aa90d3950ea902a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053227-d01d959/sideshow-darwin-amd64"
    sha256 "d84cfd80d8b2d268b95602c9e0ad4cba7e160fb1fe3a8732ea3d91f01f7c272f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053227-d01d959/sideshow-linux-amd64"
    sha256 "787a3b1b6105aba5c254ec87cb8989434268d1d514af410cb263d6f2032423d4"
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
