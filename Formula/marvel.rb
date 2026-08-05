class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.185542.9fbb6fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-185542-9fbb6fe/marvel-darwin-arm64"
    sha256 "0492f3f960f8a57fe009398a6f43a3ef613b1ff086937a49447b9fb9d2b763ff"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-185542-9fbb6fe/marvel-darwin-amd64"
    sha256 "340d1dea0afb661b158d759fff11f10ea9ed3d10ed8f4a09b2f8811def4b5bbd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-185542-9fbb6fe/marvel-linux-arm64"
    sha256 "212b2ffaaa0874784bc9b324adcf3be088a00fbcb816fcfbe2a85ac788a17435"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-185542-9fbb6fe/marvel-linux-amd64"
    sha256 "7f38a33a56bd29be980caf51ec8a98f5e515f85b0b3e4fdde6e4cdeb53d29c5b"
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
