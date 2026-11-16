class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.082647.489faf2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-082647-489faf2/marvel-darwin-arm64"
    sha256 "1873d914d97139b2ed74d98383c9bb3f4370ec8befd38f74cd0738bb01af6ef2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-082647-489faf2/marvel-darwin-amd64"
    sha256 "0bc0021ac9de87d0c602999d41ba3183ffaa15ac6b793ee697b4f651e4292c68"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-082647-489faf2/marvel-linux-arm64"
    sha256 "bdef49ec07c9e1cbaa4c5f5da78339e52abce024533f23d84403f615d7c53d93"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-082647-489faf2/marvel-linux-amd64"
    sha256 "258dd5a6719c8126a794954f07f1108fa782521d16dafe3781fd7d59f256f1bd"
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
