class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.223500.8b2634c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223500-8b2634c/marvel-darwin-arm64"
    sha256 "04f3f6ab68aec28abdece8bee325a2668718ee335e4601378950d9675761765e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223500-8b2634c/marvel-darwin-amd64"
    sha256 "97eec6360a13e5776ea38fec0cc6e17a50124c4b7b50fef759d19f0fe84959ff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223500-8b2634c/marvel-linux-arm64"
    sha256 "aa7a348395edc3e7ec5b58d9901ed84a5d45181a1da6384801878106082e5e5a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223500-8b2634c/marvel-linux-amd64"
    sha256 "724ea970e1aeb06594c3bf05a2cdeee8b9e3ea4909e99b25c284b7524d6e28d8"
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
