class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.231821.a0acb4e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-231821-a0acb4e/sideshow-darwin-arm64"
    sha256 "3990aaa44cac24251ead6b5e19040d182362d75c9069b29548bd38ba75a98cb5"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-231821-a0acb4e/sideshow-darwin-amd64"
    sha256 "0acb15611be4cbd4ef6740f953edd07c92a65cfcbb4deb76a4da16d90701f63c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-231821-a0acb4e/sideshow-linux-amd64"
    sha256 "23d784230159122dd0dcfe361b6856fc99bd2f09034baec53b2c8f9705c45eb1"
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
