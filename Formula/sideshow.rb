class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.104713.2ce9fe4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-104713-2ce9fe4/sideshow-darwin-arm64"
    sha256 "593eca2e8ec9e4c225bbc7db03aa982ab4df363c1b726d90be38ddaaa98ebff9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-104713-2ce9fe4/sideshow-darwin-amd64"
    sha256 "80cda91c6124b7dbd85ca390463db08f3afe28da38e4631cb4262ecd1b67899a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-104713-2ce9fe4/sideshow-linux-amd64"
    sha256 "639c7c4c4e987744c4791d045dbaa57a80d6f79588fa722a8d747bbbb347b6ef"
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
