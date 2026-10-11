class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261011.192714.3f6f9b9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-192714-3f6f9b9/marvel-darwin-arm64"
    sha256 "9935cbee614f3b1d64771c1ba4dbb94fd88a670ba0988115b68bd679a0199c68"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-192714-3f6f9b9/marvel-darwin-amd64"
    sha256 "62710d8243294bfc948dedf0e39a8cfb69165f37e3204116c9bec0f48efdc46c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-192714-3f6f9b9/marvel-linux-arm64"
    sha256 "50cfb0db5fb1031b857026c7a5737cf26caa7b1d8afa6c5073bf9e8f914d4c8f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-192714-3f6f9b9/marvel-linux-amd64"
    sha256 "d7532c8d83f13db896267b3a00d1b209fb4f1bbe6fb66983b3ecce761084262a"
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
