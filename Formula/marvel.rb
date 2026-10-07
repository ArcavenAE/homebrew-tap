class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.235003.5a3dcc8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235003-5a3dcc8/marvel-darwin-arm64"
    sha256 "5bdb993e96240ed381d081b5870b510bf0ed4f5aa8714dd2110e7ba493c9b4a2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235003-5a3dcc8/marvel-darwin-amd64"
    sha256 "73e7ededca9d52df187280f852e34f6b3f2b599ed4921e96f780253df8829365"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235003-5a3dcc8/marvel-linux-arm64"
    sha256 "49926180ba807cf0a298fcbbb630620b90edd7181d27074eeecde6d36f4ff15f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235003-5a3dcc8/marvel-linux-amd64"
    sha256 "e1f01fe35b0e1f07372bc6aa5e7933b9fde58e2b798fb8b1041804d6bd0ec431"
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
