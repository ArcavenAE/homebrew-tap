class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260426.223203.bbd2978"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223203-bbd2978/sideshow-darwin-arm64"
    sha256 "680c1daba70da60c70bac6d5b7b332cf85ad40d3cb68e0899ab74f9f663103a2"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223203-bbd2978/sideshow-darwin-amd64"
    sha256 "7427691a22ddecd602fca97c282c41a16e6de607d231759ac2845b561a056f8a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223203-bbd2978/sideshow-linux-amd64"
    sha256 "8f868ff1cd80c45b5fecef1729a0a2c46009af63e8d65e43d74efeb1fec8d648"
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
