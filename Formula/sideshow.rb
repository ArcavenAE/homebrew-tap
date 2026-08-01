class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.014108.e2741f1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-014108-e2741f1/sideshow-darwin-arm64"
    sha256 "75760abcf66a16c6b1a30dd3588493fb2f9a8bdbc2f641df08f5fee716e6c28e"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-014108-e2741f1/sideshow-darwin-amd64"
    sha256 "425244d40ad44a2b3a644841245acf0fefa6d65cc3c34d135ceed05327a58eab"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-014108-e2741f1/sideshow-linux-amd64"
    sha256 "6601aaa087bcf3a79202a69528892185f6acbc6dc31fddec3f4a486b7f5ca19b"
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
