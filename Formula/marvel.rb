class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.053254.9e20e4e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-053254-9e20e4e/marvel-darwin-arm64"
    sha256 "e50a0d28d82aefcd3a028ef34ec71f4bd327366ec68044ded38f1c36bd45af61"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-053254-9e20e4e/marvel-darwin-amd64"
    sha256 "773923395e7cab96b9db9cb5be162d6151863a472a65dea8966302ef34886857"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-053254-9e20e4e/marvel-linux-arm64"
    sha256 "cc70243eeea4a43bf36f278f6d011c627a257f4a40fefe3162d15308177c192f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-053254-9e20e4e/marvel-linux-amd64"
    sha256 "77f15c5621be3de6e120cae4d49a1d9f681966c2d919888c15a189c87e926621"
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
