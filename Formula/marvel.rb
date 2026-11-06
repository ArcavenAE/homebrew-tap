class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.040152.2cbc54f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-040152-2cbc54f/marvel-darwin-arm64"
    sha256 "d299ae0c821e4228ca11574f04affaae3eb12a5cc51d0b7f985ab2034f1e5476"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-040152-2cbc54f/marvel-darwin-amd64"
    sha256 "e4ee20fc427e6dcbdcc568043bdd4bd535fbc2c99cb3ed2b7ecca7e905d74feb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-040152-2cbc54f/marvel-linux-arm64"
    sha256 "5735841b4c63300b82ed125a63b8f858e462830880e322db5aee894ff3dd4376"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-040152-2cbc54f/marvel-linux-amd64"
    sha256 "b51955c1b218b532a45d3abfb903e1466c7389649acf9eafdb97aeb372dc7a5c"
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
