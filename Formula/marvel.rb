class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.191234.99de0f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191234-99de0f7/marvel-darwin-arm64"
    sha256 "7a59105c709e4ed2b4dcb41628a62d32cd2a7b9920edeb1d67c3b73e5d380963"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191234-99de0f7/marvel-darwin-amd64"
    sha256 "bbe38e6e48cab03f9973a2f533ba565cb848c517777aaa5baa20414afeb6e623"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191234-99de0f7/marvel-linux-arm64"
    sha256 "370b751c759b3c8727994096e3152e845637d361680d417905d084c325efabc5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-191234-99de0f7/marvel-linux-amd64"
    sha256 "3ba4b4a83e9f32fa53645994c391c7cff60e50c5d69b818b96ab0323b4ab0eda"
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
