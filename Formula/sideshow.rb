class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.084724.e513976"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-084724-e513976/sideshow-darwin-arm64"
    sha256 "722be3aaf8196c4617d7afc1524728db7343017d8db5e45fcde735909568743f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-084724-e513976/sideshow-darwin-amd64"
    sha256 "bf6804996eb9e03f84a3ed4205061ce182481fbb1eb512dbd299dcad0fd11956"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-084724-e513976/sideshow-linux-amd64"
    sha256 "20fb385729705d085b34be7660c302a77b77003d72406946de77f1370bda95d2"
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
