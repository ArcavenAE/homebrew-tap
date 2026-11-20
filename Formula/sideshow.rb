class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261120.095854.b28738c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261120-095854-b28738c/sideshow-darwin-arm64"
    sha256 "25dc9d913ba018301b1e428f096a293d2292d410cdac5799269c5407644a606e"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261120-095854-b28738c/sideshow-darwin-amd64"
    sha256 "9d0106d22222a4fa5c1dd53eb90e7148ad9a33e8196fba95186eed36156b9969"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261120-095854-b28738c/sideshow-linux-amd64"
    sha256 "fc6b3a84e6d6abcbb6fca31be1bdd2526e4893e2e8649868fcea9e546d5252db"
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
