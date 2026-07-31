class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.230223.5ec14d8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-230223-5ec14d8/marvel-darwin-arm64"
    sha256 "67f526d82e2a84096e46baffa0bd462a92f5eff58efb1afb92a69406b5c4cf22"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-230223-5ec14d8/marvel-darwin-amd64"
    sha256 "2a648a7b5c77d3f09c2d6cc2a1058fa0e9d8bd94dcb18bdc145c5ae040091519"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-230223-5ec14d8/marvel-linux-arm64"
    sha256 "9f98d570b864c1600e33a839987f272625cf5d86ce9f968c3f8712aad185c55b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-230223-5ec14d8/marvel-linux-amd64"
    sha256 "dd3a4453b98c7b379bbfef3c06a4c8103c5c4f1344d5d5b30141e73442951809"
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
