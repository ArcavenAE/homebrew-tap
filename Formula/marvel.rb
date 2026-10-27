class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.154021.767daab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154021-767daab/marvel-darwin-arm64"
    sha256 "c61076f20933049ede9888c2827012feb6663ff8837c3c5de89dd1817a3df936"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154021-767daab/marvel-darwin-amd64"
    sha256 "9ee9b65f410de42b43509cbbc59a181e4a7a3ca65c6ce3c3ba6e87850dca1922"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154021-767daab/marvel-linux-arm64"
    sha256 "575227ab7f740ee64cf50539e44524252471733e0a93fea081cfa73ce2c6985b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154021-767daab/marvel-linux-amd64"
    sha256 "2fcc2eeddb64be737365ffb42c71bd2ac06e7783021a6946f6c1383e0ab17599"
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
