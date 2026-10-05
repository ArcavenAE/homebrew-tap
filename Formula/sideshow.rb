class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261005.190421.a591a1b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261005-190421-a591a1b/sideshow-darwin-arm64"
    sha256 "c801b66109542de00bcbb758c8a03d750a756a72bd010f29996f03b6de6d658a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261005-190421-a591a1b/sideshow-darwin-amd64"
    sha256 "b50a871bbf5bb55d153878f0ec6dbae1aea6d5be22dd0c010e36886483afc3ef"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261005-190421-a591a1b/sideshow-linux-amd64"
    sha256 "8803796bca1b7c5aa9c071c233248237629a05386da2fa31df20072f9eca6e27"
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
