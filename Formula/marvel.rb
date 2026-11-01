class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.025422.28a698a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025422-28a698a/marvel-darwin-arm64"
    sha256 "8edae33772c079121a5c674b3bb5615213530b6f3b551f8ba36e253216feded3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025422-28a698a/marvel-darwin-amd64"
    sha256 "e4282b92197bcb6d1ddcb7520ac8058a9bcdb4349b21053e9700e5b079a87c1a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025422-28a698a/marvel-linux-arm64"
    sha256 "8f2d87c80c4f311bcec5d07d5e3feb9c442610f9c1bd77e8cec58960a7da805e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025422-28a698a/marvel-linux-amd64"
    sha256 "514671297a6536d7d4e812d4b0ee680de42e06e23a493174041f4ed2ab219ab0"
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
