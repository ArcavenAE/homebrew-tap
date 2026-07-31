class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.181821.f1d1fc7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-181821-f1d1fc7/sideshow-darwin-arm64"
    sha256 "55e8f7205012de270ef875d0d156e6fc7a277c02ae9d9757a4518b6d2a0921d1"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-181821-f1d1fc7/sideshow-darwin-amd64"
    sha256 "6594b53a478d56595bd8cf844eca86438dbdf55e05c9035b4aeed832768c1909"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-181821-f1d1fc7/sideshow-linux-amd64"
    sha256 "d4c906467de70e2701cb4757859ec260bb1b8b03508a527bc201f24509bc3e41"
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
