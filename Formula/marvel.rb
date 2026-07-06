class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260706.015543.92453c5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-015543-92453c5/marvel-darwin-arm64"
    sha256 "65abd6953080afaa9addc02ef11d9a383399bbf5f317145444a7de66cf53291d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-015543-92453c5/marvel-darwin-amd64"
    sha256 "85cd0bf92bb65b8de58515244ec989539d8087741e8aec6468dc9f373768a18a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-015543-92453c5/marvel-linux-arm64"
    sha256 "64a5a2936df5f1203f1893b202859864c8488c877d92f990c0010b72857a97ef"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260706-015543-92453c5/marvel-linux-amd64"
    sha256 "c32e61271c0bc38b6f7a5c406fe716e051ee51043ec2ea500c070c62f4a8659e"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
