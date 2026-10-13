class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261013.224140.23e7989"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-224140-23e7989/marvel-darwin-arm64"
    sha256 "6867f0c02a68b94a76f82ba859a178c9e009d27a6e6028e11b0887fa001cb289"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-224140-23e7989/marvel-darwin-amd64"
    sha256 "ce5149b526bd869105c4025dc09ef847c05403ba94c8f6ae4f9c3b1996e6186a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-224140-23e7989/marvel-linux-arm64"
    sha256 "fab309895ca30134a562e93d40796bbb5c48384ceb78ebf52598766a63000765"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-224140-23e7989/marvel-linux-amd64"
    sha256 "764bea23b7b56b8adbd8dc51c5f4ae8033f83613a46dbbe83e1f0f9f1cffde3a"
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
