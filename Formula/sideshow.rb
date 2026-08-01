class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.023505.245772d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-023505-245772d/sideshow-darwin-arm64"
    sha256 "16f22545c2ef21090b7359f23db6ffc2de8752a8d2bf8b301354e48820890e4c"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-023505-245772d/sideshow-darwin-amd64"
    sha256 "64ec77c5fea2b681c19478ff8dbf286649a5d3e4483c73f9278af5ac11bbff56"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-023505-245772d/sideshow-linux-amd64"
    sha256 "90d8e71843dcdfee6e392cee219c98bebddaf2a7bf0f4af7bcc909a7a312f357"
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
