class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.025852.4ab7082"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-025852-4ab7082/sideshow-darwin-arm64"
    sha256 "adde957c3b85bdd13b5fb5738204b422c93aedf657f9b7d309fde00867c67571"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-025852-4ab7082/sideshow-darwin-amd64"
    sha256 "e833ce166c14e52993bced364fff73bd70a357ba59e89530a5517a5bca138c3a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-025852-4ab7082/sideshow-linux-amd64"
    sha256 "00de0ef3950df531745ac2e46d51dc5407e15f45aca3bba9595268b187594c36"
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
